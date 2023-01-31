public class RankHandler {
    public string rankPrize(integer rank){
        string prize = '';
        if (rank == 1) {
            prize = 'Gold';
        } else if (rank == 2) {
            prize = 'Silver';
        } else if (rank == 3) {
            prize = 'Bronze';
        } else {
            if (rank <= 10) {
                prize = 'Top 10, congratulation';
            }else {
                prize = 'Thank you for participations';
            }
        }

        return prize;
    }

    public string rankPriceSwitch(integer rank){
        string price = '';
        switch on rank {
            when 1 {
                price = 'Gold';
            }
            when 2 {
                price = 'Silver';
            }
            when 3 {
                price = 'Bronze';
            }
            when 4, 5, 6, 7, 8, 9, 10 {
                price = 'Top 10';
            }
            when else {
                price = 'Good job buddy';
            }
        }
        return price;
    }
}