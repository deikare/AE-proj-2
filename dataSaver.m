function dataSaver(title, path, FormattedGenerations)
    print_to_file([(1:length(FormattedGenerations(1).maxValues))', FormattedGenerations(1).maxValues], [path, title, '_max_both.txt']);
    print_to_file([(1:length(FormattedGenerations(1).minValues))', FormattedGenerations(1).minValues], [path, title, '_min_both.txt']);
    print_to_file([(1:length(FormattedGenerations(1).meanValues))', FormattedGenerations(1).meanValues], [path, title, '_mean_both.txt']);
    print_to_file([(1:length(FormattedGenerations(1).variance))', FormattedGenerations(1).variance], [path, title, '_var_both.txt']);
    
    print_to_file([(1:length(FormattedGenerations(2).maxValues))', FormattedGenerations(2).maxValues], [path, title, '_max_fit.txt']);
    print_to_file([(1:length(FormattedGenerations(2).minValues))', FormattedGenerations(2).minValues], [path, title, '_min_fit.txt']);
    print_to_file([(1:length(FormattedGenerations(2).meanValues))', FormattedGenerations(2).meanValues], [path, title, '_mean_fit.txt']);
    print_to_file([(1:length(FormattedGenerations(2).variance))', FormattedGenerations(2).variance], [path, title, '_var_fit.txt']);
    
    print_to_file([(1:length(FormattedGenerations(3).maxValues))', FormattedGenerations(3).maxValues], [path, title, '_max_other.txt']);
    print_to_file([(1:length(FormattedGenerations(3).minValues))', FormattedGenerations(3).minValues], [path, title, '_min_other.txt']);
    print_to_file([(1:length(FormattedGenerations(3).meanValues))', FormattedGenerations(3).meanValues], [path, title, '_mean_other.txt']);
    print_to_file([(1:length(FormattedGenerations(3).variance))', FormattedGenerations(3).variance], [path, title, '_var_other.txt']);
end

