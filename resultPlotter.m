function fig = resultPlotter(FormattedGenerations, plottitle)
%% funkcja drukująca wykresy min/max/mean oraz wariancji
    fig = figure;
    t = tiledlayout(3, 2, 'TileSpacing', 'compact', 'Padding', 'compact');
    
    for i = 1 : 3
        nexttile;
        stairs(1 : length(FormattedGenerations(i).maxValues), FormattedGenerations(i).maxValues);
        hold on
        stairs(1 : length(FormattedGenerations(i).minValues), FormattedGenerations(i).minValues);
        stairs(1 : length(FormattedGenerations(i).meanValues), FormattedGenerations(i).meanValues);
        ylabel('funkcja celu');
        xlabel('pokolenie');
        legend('max', 'min', 'srednia', 'Location', 'southeast');
        legend('boxoff');
        title(FormattedGenerations(i).titleValues);
        hold off
        
        nexttile;
        stairs(1 : length(FormattedGenerations(i).variance), FormattedGenerations(i).variance);
        hold on
        ylabel('wariancja');
        xlabel('pokolenie');
        title(FormattedGenerations(i).titleVariance);
        hold off
    end
    title(t, plottitle);
end

