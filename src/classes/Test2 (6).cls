public class NestedTernaryExample {
    public static void main(String[] args) {
        int score = 85;
        int experience = 5;
        boolean hasLeadershipTraining = true;

        String performance = (score >= 90) ? 
                                ((experience >= 5) ? 
                                    (hasLeadershipTraining ? 'Leadership Position' : 'Needs Leadership Training') 
                                    : 'Needs More Experience') 
                                : (score >= 70) ? 
                                    ((experience >= 2) ? 
                                        (hasLeadershipTraining ? 'Senior Position' : 'Needs Leadership Training for Senior Position') 
                                        : 'Needs More Experience for Senior Position') 
                                    : (experience >= 1) ? 
                                        'Junior Position' 
                                        : 'Needs More Experience for Any Position';

        if (a == 5) { // +1 for if statement
            while (b > 0) { // +1 for while loop
                for (int i = 0; i < 10; i++) { // +1 for for loop
                    if (c == 0) { // +1 for nested if statement
                        c++;
                    } else if (c == 1) { // +1 for else if
                        c += 2;
                    } else { // +1 for else
                        c += 3;
                    }
                }
                b--;
            }
        } else if (a == 6) { // +1 for else if
            do {
                b--;
            } while (b > 0); // +1 for do while loop
        } else { // +1 for else
            b = (a == 5) ? 0 : 1; // +1 for ternary operator
        }

        System.out.println(performance);
    }

    public static void alternative() {
        Assert.areEqual('foo', resultObject.bar, 'Failed assert message');


        String someVariable = 'foo';
        Assert.areEqual('foo', resultObject.bar, 'Failed assert message');
    }
}