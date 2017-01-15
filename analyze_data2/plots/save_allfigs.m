

function save_allfigs(currcommit,currfigname)
    %% save_allfigs
    % % For loop for saving figs
    if ~exist('currcommit'); currcommit = '003_paper2_'; end
    if ~exist('currfigname'); currfigname = 'Fig6'; end
    savenames={'fig1','fig2','fig3','fig4','fig5','fig6','fig7','fig8','fig9','fig10','fig11','fig12','fig13','fig14','fig15','fig16','fig17','fig18','fig19','fig20','fig21','fig22','fig23','fig24','fig25','fig26','fig27','fig28','fig28','fig30','fig31','fig32'};
    mydate = datestr(datenum(date),'yy/mm/dd'); mydate = strrep(mydate,'/','');
    c=clock;
    sp = ['d' mydate '_t' num2str(c(4),'%10.2d') '' num2str(c(5),'%10.2d') '' num2str(round(c(6)),'%10.2d')];
    sp = [sp '__' currcommit '_' currfigname];
    basepath = '.';
    % basepath = '~/figs_tosave';
    %
    mkdir(fullfile(basepath,sp));
    multiplot_on = 0;
    do_pdf = 0;
    for i=[1:11]
        %figure(i); %ylim([0 0.175])
%         title('');
        %ylabel('');
        %xlim([-1.5 2.2]);
        %ylabel('Avg z-score |\Delta FFC|')
%         set(gcf,'Position',[0.1076    0.4544    0.7243    0.3811]);
        
%         print(gcf,'-dpng','-r200',fullfile(basepath,sp,savenames{i}))
        

%         print(gcf,'-dpdf',fullfile(basepath,sp,savenames{i}))
        %close
        if ~multiplot_on
%             set(gcf,'Position',[0.1076    0.4544    0.7243    0.3811]);
%             set(gcf,'Position',[0.1071    0.2381    0.7250    0.5981]);         % Size for when 3 rows of subplots
%             set(gcf,'Position',[0.8257    0.1256    0.1743    0.7689]);         % Size to compare Carracedo
                                                                                % To get only 1 cell trace, run: data(1).model.specification.populations(1).size=1;
        end
        if ~do_pdf
            set(i,'PaperPositionMode','auto');
%             print(gcf,'-dpng','-r200',fullfile(basepath,sp,savenames{i}))
            print(i,'-dpng',fullfile(basepath,sp,savenames{i}))
        else
            set(i,'PaperPositionMode','manual');
            print(i,'-dpdf',fullfile(basepath,sp,savenames{i}))
        end
    end
    %%
    mycomment = ['Autocommit associated with saved figures. Figs_batch_6_0, Fg6_00 to Fg6_01b. Imag'];
    currd = pwd;
    cd ../..
    system('git add *');
    system(['git commit -am "' sp ' ' mycomment '"']);
    cd(currd);


end