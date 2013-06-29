From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: Dabase BAcked IPTables
Date: Sat, 29 Jun 2013 17:47:29 +0300
Message-ID: <51CEF381.9000701@ngtech.co.il>
References: <CAGWRaZYZnq3bneKNdisrRAfk=9PvKD=cXVWN_b0ySVRMaPw9Dw@mail.gmail.com> <20130628231910.GE10741@harrier.slackbuilds.org> <CAGWRaZYeBkaVrY3YgmgZdi7oUb9jGOkwtCZSnNU0c31wssYkpQ@mail.gmail.com> <20130629002801.GG10741@harrier.slackbuilds.org> <CAGWRaZbhje76Lxxp_jr=xGpshyPYz-=k=H3N_XEgeH3nmqPJMg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAGWRaZbhje76Lxxp_jr=xGpshyPYz-=k=H3N_XEgeH3nmqPJMg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nick Khamis <symack@gmail.com>
Cc: netfilter@vger.kernel.org

The internet works on IP not on mac....
it's like "I want to buy a car who don't move"
OK NP just buy something else then a car...

ipset is the tool and you would need couple security levels in order to 
prevent spoofing and defending aginst Some malicious attempts on this 
site..

Eliezer

On 06/29/2013 04:21 AM, Nick Khamis wrote:
> Ooops, I realized how many blanks I am leaving in my messages. The
> website is only used to allow the user to enter their mac address in
> order to have access to our services (not HTTP).
>
> Yes, ./iptables.sh is the ruleset script.
>
>>> When you update your ipset, any rule referring to that set uses the
>>> new set right away. There would be no point in dumping and then
>>> reloading your ruleset.
>
> Hmm, this covers adding *new* mac or even ip addresses however, how
> would delete/modify existing entries dynamically.
>
> Kind Regards.
>
> Nick.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

