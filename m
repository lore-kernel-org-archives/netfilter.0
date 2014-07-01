From: Paul Robert Marino <prmarino1@gmail.com>
Subject: Re: help needed preventing bruteforce behind a reverse proxy
Date: Tue, 1 Jul 2014 15:02:26 -0400
Message-ID: <CAPJdpdBTrB6MmrQri-dFT2hOW+MHodaE-SmJ9yLbF_HnQcSAiw@mail.gmail.com>
References: <53B26B4C.4030002@gmail.com>
	<53B2ED11.4020902@ngtech.co.il>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=nueInikTEvMAPTQVGLrEclS5+X9hAPQ4Jw160C3iDCQ=;
        b=uJuVgpNN08zOpRu5ldeCQGAXXquebTQ69fPSn4/w2XSF7Y1/owUgSGuUXPuzzdmvI+
         8XxF0H0WiLs7xdLCDGRQLwKT5h8J19qR/yV30zXaOSw34SduIdavWDfPbRCMvfZt1Ize
         JAJVbJjx5ZfPKGuyqlnQH4D5ksBLkWh8rIpmjsbiKIgESy3W1ZqW2p8KCsSRRGEuUjUq
         Jb1fgp2beexXheYoehvhkW9J3ledHR5yXXzxabFVw+RX1X6jFdOJst2ktZg+c+qeRs64
         CpfOk+626OcdNk+yga+xGdYN884/lk0U5aj1nDsr9bzHP9GBCuGFS8hKO7bqdtWupFVv
         RKHA==
In-Reply-To: <53B2ED11.4020902@ngtech.co.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eliezer Croitoru <eliezer@ngtech.co.il>
Cc: netfilter@vger.kernel.org, Francesco Morosinotto <francescomorosinotto@gmail.com>

here is a nice brief article on how to fix the logging issue with a
squid reverse proxy instead
http://www.howtoforge.com/how-to-set-up-a-caching-reverse-proxy-with-squid-2.6-on-debian-etch

Although this article is a little old I would use squid 3.x instead
its been stable for reverse proxies since at least 2004 if not longer.

the portion at the beginning about the logging directly addresses your issue.

PS. An Apache revers proxy in front of Apache servers is a security
risk because they have the same vulnerabilities.
Squid is the core of many commercial products companies call web
application firewalls and has been for over a decade.



On Tue, Jul 1, 2014 at 1:17 PM, Eliezer Croitoru <eliezer@ngtech.co.il> wrote:
> Hey Francesco,
>
> You are kind of in the wrong way of looking at the issue.
> There are couple sides to the issue:
> - iptables
> - fail2ban
> - apache\web server or proxy server
>
> One non related question I have is just interesting me: Why did you choose
> apache as a reverse proxy?(there are other options.. feel free to not answer
> it on the public list)
>
> And for the subject:
> iptables does what it does by the instructions it gets. so it's not related
> to iptables directly.
> iptables on the web service is kind of weird to implement because the web
> server is never even seeing the packets src IP else then the reverse proxy
> one.
> So it's better to implement on the reverse proxy then the origin server or
> to implement a "PUSH" rule that will add the blacklisted IP to the reverse
> proxy FW.
>
> Fail2ban does what you as admin instruct it to do and by reading logs.
> This is why you do see this issue.
> Probably because you didn't configured your web+proxy the right way the
> webserver is logging the origin IP as the reverse proxy one and there for
> fail2ban does what it does due to the default policy it has regarding
> attacks.
>
> So fail2ban just sends a command to some application and if the log is not
> clear\good you will have issues.
> Normalize your logs to work with fail2ban + iptables.
> I am recommending to use the: mod_remoteip for apache
> Which is integrated in apache 2.4 and can be built for 2.2.
> From my experience it works better and logs nicely.
> (opposed to some weird logs which shows two or three ips on the same log
> entry)
>
> If you can get the error from fail2ban you will see that there is a
> malformed IP in your command.
> You can use a fake command such as echo to log what fail2ban extracts from
> the logs and sends to iptables to verify in more depth the relate issue.
>
> What OS are you using?(what distro)
>
> My suggestion is to implement the fail2ban rules on the reverse proxy
> machine and not on the origin server.
> If and only if you can't or doesn't want to, then use a PUSH throw SSH or
> any other mean to blakclist the IP in the Reverse proxy iptables.
>
> If you have a really huge blacklist consider using "ipset" on the reverse
> proxy to make the lookup faster.
>
> And really I only now understand why it was related to netfilter\iptables.
>
> Take a look at the example from microtik:
> http://wiki.mikrotik.com/wiki/Use_Mikrotik_as_Fail2ban_firewall
>
> Which shows how to do it with microtik router.
> On a linux FW and on the Reverse Proxy it will look a bit different.
> The command can look like:
> /usr/bin/fw_add "<ip>"
> /usr/bin/fw_remove "<ip>"
>
> and the script fw_add:
> #!/bin/bash
> COMMAND="iptables -I FORWARD -t fail2banINBlock -s $1 -j REJECT
> --reject-with icmp-host-prohibited"
> ssh -l linux -p22 -i /root/.ssh/id_dsa FW-IP-ADDRESS "$1"
>
> The remove script fw_remove:
> COMMAND="iptables -D FORWARD -t fail2banINBlock -s $1 -j REJECT
> --reject-with icmp-host-prohibited"
> ssh -l linux -p22 -i /root/.ssh/id_dsa FW-IP-ADDRESS "$1"
>
> On apache the settings for the module can be:
> RemoteIPHeader X-Forwarded-For
> RemoteIPTrustedProxy IP_OF_REVERSE_PROXY.
>
> It is also advised to clean\override any "x_forward_for" headers on the
> reverse proxy to prevent issues which have been seen many times.
>
> It works in many places and can help a lot.
> If you have CentOS 6.5 64 bit I can send you the mode_remoteip.so module
> file.
>
> All The Bests,
> Eliezer
>
>
> On 07/01/2014 11:03 AM, Francesco Morosinotto wrote:
>>
>> Hi guys,
>>
>> I'm a young "system administrator" that works for a non profit
>> organization.
>> I've recently implemented owncloud on a local server running several
>> virtual machines.
>> Having only a static IP every service (running on different vms) is
>> served through a reverse proxy (apache).
>>
>> I'm trying to secure my cloud installation in order to prevent
>> bruteforce attack: I can log the attackers IP (using apache-mod-rpaf
>> that reads the original ip from the x-forwarded-for header) and I was
>> setting up fail2ban to add these ips to a blacklist and deny the access
>> through iptables.
>>
>> But It seems that iptables is not able to understand where does the
>> request come from and always log the internal proxy ip address.
>>
>> Is there a way to tell iptables to read the x-forwarded-for headers?
>>
>> can you suggest some other workaround?
>>
>> thank you guys
>>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
