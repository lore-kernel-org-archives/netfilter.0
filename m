From: "Eljas Alakulppi" <Buzer@buzer.net>
Subject: Re: Squid transparent proxy /iptables (Yahoo messenger/Gmail/Https not works)
Date: Sun, 27 Jan 2008 21:17:42 +0200
Message-ID: <op.t5lrvstsrtqp7s@hagumi>
References: <54a362580801271111vbc33fd6vf732922cd3b24@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <54a362580801271111vbc33fd6vf732922cd3b24@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: yogesh@technotux.net, netfilter@vger.kernel.org

You can't transpently proxy https traffic. Search "man-in-the-middle  
attack" with Google/your favorite search egine for explanation.

Yogesh Patil <yogesh@technotux.net> kirjoitti Sun, 27 Jan 2008 21:11:30  
+0200:

> Hello,
>      I am using SQUID 2.6.STABLE17 with fedora core 8, & BIND
> DNS SERVER configured on the same box, i have configured squid as
> transparent proxy with all default settings , and applied iptables
> rule by using the following
> command
>
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT
> --to-port 3128
>
>      so the problem is that i am able to browse websites very well,
> but Gmail, Yahoo Messenger, MSN Messenger etc.. and all the websites
> using https not works, what would be the issue ?
>
> Regards,
> Yogesh Patil
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


