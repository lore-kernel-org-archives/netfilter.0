From: pauloric@contatogs.com.br
Subject: Re: sudo /sbin/iptables -v -t filter -A INPUT -p tcp --dport 22 -s
 124.225.122.167 -j REJECT does not stop ssh attack
Date: Wed, 13 Oct 2010 15:03:59 -0300 (BRT)
Message-ID: <3469375.485.1286993039640.JavaMail.root@mercurio>
References: <AANLkTimbhPn+S63HvtvhOMZemGY5tGyzk-b1gjQUg_K5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimbhPn+S63HvtvhOMZemGY5tGyzk-b1gjQUg_K5@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


Hi
----- Mensagem original -----
> Sorry for the long subject.
> 
> But I execute this on my system ...
> 

> sudo /sbin/iptables -v -t filter -A INPUT -p tcp --dport 22 -s
> 124.225.122.167 -j REJECT does not stop ssh attack

instead of -A try -I as following:
sudo /sbin/iptables -v -t filter -A INPUT -p tcp --dport 22 -s 124.225.122.167 -j REJECT

Order is important for netfilter...80)



best regards

> 
> ... yet message continue to scroll by in my /var/log/secure file
> 
> Oct 13 10:33:27 localhost sshd[28222]: Failed password for root from
> 124.225.122.167 port 36421 ssh2
> Oct 13 10:33:27 localhost sshd[28223]: Received disconnect from
> 124.225.122.167: 11: Bye Bye
> Oct 13 10:33:28 localhost sshd[28227]: pam_unix(sshd:auth):
> authentication failure; logname= uid=0 euid=0 tty=ssh ruser=
> rhost=124.225.122.167 user=root
> Oct 13 10:33:30 localhost sshd[28227]: Failed password for root from
> 124.225.122.167 port 39871 ssh2
> Oct 13 10:33:30 localhost sshd[28228]: Received disconnect from
> 124.225.122.167: 11: Bye Bye
> Oct 13 10:33:32 localhost sshd[28232]: pam_unix(sshd:auth):
> authentication failure; logname= uid=0 euid=0 tty=ssh ruser=
> rhost=124.225.122.167 user=root
> Oct 13 10:33:34 localhost sshd[28232]: Failed password for root from
> 124.225.122.167 port 43158 ssh2
> Oct 13 10:33:34 localhost sshd[28233]: Received disconnect from
> 124.225.122.167: 11: Bye Bye
> 
> 
> The messages eventually do stop but I cannot tell if that is because
> iptables stopped it or the attacker just gave up?
> 
> 
> Is there something wrong with my version of iptables or is my iptables
> command no good?
> 
> Thanks
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html

-- 
Paulo Ricardo Bruck - consultor 
tel 011 3596-4881 011 3596-4882 cel 011 9235-4327 
Contato Global Solutions 
http://www.contatogs.com.br 

