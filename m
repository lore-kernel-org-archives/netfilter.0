From: "Yogesh Patil" <yogesh@technotux.net>
Subject: Re: Squid transparent proxy /iptables (Yahoo messenger/Gmail/Https not works)
Date: Mon, 28 Jan 2008 02:17:11 +0530
Message-ID: <54a362580801271247p30b2b55bld8f4c74b3ace553@mail.gmail.com>
References: <54a362580801271111vbc33fd6vf732922cd3b24@mail.gmail.com>
	 <op.t5lrvstsrtqp7s@hagumi>
Reply-To: yogesh@technotux.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <op.t5lrvstsrtqp7s@hagumi>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eljas Alakulppi <Buzer@buzer.net>
Cc: netfilter@vger.kernel.org

Hi,
    Thanks for the reply, but i don't want to really proxy https
traffic i now it is secure, but i want to give access to the websites
which are using https as my internet connection is connected on the
linux box which is having installed BIND DNS, Squid Proxy, and
configured iptables i just want to know, how to allow https websites &
Yahoo messenger which uses socks for connecting to it's servers.

Thanks
Yogesh

On 1/28/08, Eljas Alakulppi <Buzer@buzer.net> wrote:
> You can't transpently proxy https traffic. Search "man-in-the-middle
> attack" with Google/your favorite search egine for explanation.
>
> Yogesh Patil <yogesh@technotux.net> kirjoitti Sun, 27 Jan 2008 21:11:30
> +0200:
>
> > Hello,
> >      I am using SQUID 2.6.STABLE17 with fedora core 8, & BIND
> > DNS SERVER configured on the same box, i have configured squid as
> > transparent proxy with all default settings , and applied iptables
> > rule by using the following
> > command
> >
> > iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT
> > --to-port 3128
> >
> >      so the problem is that i am able to browse websites very well,
> > but Gmail, Yahoo Messenger, MSN Messenger etc.. and all the websites
> > using https not works, what would be the issue ?
> >
> > Regards,
> > Yogesh Patil
> > -
> > To unsubscribe from this list: send the line "unsubscribe netfilter" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>


-- 
Regards,
Yogesh Patil
Technotux Solutions
33/114, Gandhi Nagar,
Jilha Peth, Jalgaon - 425001
Maharashtra, INDIA
Phone :- +91-257-2235596
Mobile:- +91-9890931432, 9422778329
