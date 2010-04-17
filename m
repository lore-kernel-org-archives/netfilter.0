From: Alessandro Vesely <vesely@tana.it>
Subject: Re: can we design a modified fail2ban ?
Date: Sat, 17 Apr 2010 18:01:21 +0200
Message-ID: <4BC9DB51.6000407@tana.it>
References: <4BC7E028.8050209@infoservices.in> <alpine.LSU.2.01.1004160923230.31861@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tana.it; s=test;
	t=1271520081; bh=Ab2c96p2uTUUjPLFA9eLMTDV9JQuglr3/vIyLI4QPgg=;
	l=1942;
	h=Message-ID:Date:From:MIME-Version:To:CC:References:In-Reply-To:
	 Content-Transfer-Encoding;
	b=jGc362qQ5IZKp6zpRpjtMVCvyRuX0TdExmWqbdRroIRbP8CiSJ9VNWdHWb1eO/lmq
	 2AVZ4eydx0fkbB0dfglbBz379Lg4O5bFima7LckVC69n9bvfmeR36B8zC1t2rplNOU
	 ivDxlLu9PfgTrgkEMI+8N5Nlh3sB7aPSx9FCStrA=
In-Reply-To: <alpine.LSU.2.01.1004160923230.31861@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "J. Bakshi" <joydeep@infoservices.in>
Cc: netfilter@vger.kernel.org

On 16/Apr/10 09:28, Jan Engelhardt wrote:
> On Friday 2010-04-16 05:57, J. Bakshi wrote:
>>
>>fail2ban is a popular application to prevent the brute-force attack
>>against ssh and also against imap, pop3 etc.. But fail2ban actually
>>blacklist the IP and this is what fail2ban has been designed for.
>>Now a days [nowadays] we can design the same with iptables.
>
> fail2ban has the ability - if I read its own short description right - to
> already use various blocking methods, including not only /etc/hosts.deny
> but also iptables.

I don't think it uses netfilter, though. I've read it has to restart a 
daemon in order to unlist an IP --not sure it's still so for the 
current version.

>>I wonder if iptables can
>>provide more liberty to match IP as well as port combination so that we
>>don't need to blacklist the IP but only block the attempts from the IP
>>based on port. Say more than 3 ssh attempt from IP xxx.xxx.xxx.xxx is
>>detected and no more ssh attempt from the same ip is no more possible
>>but pop and imap still works. Is it really possible with iptables ? Any
>>idea ?

The fail2ban doubts I mentioned above are the raison d'etre of ipqbdb. 
It matches IPs for responses, but it leaves it up to the sysadmin to 
configure iptables. For example, an admin may call the NFQUEUE rule 
only for ssh, so as to live pop3 and imap alone; or call NFQUEUE with 
a different queue-num for different services, so as to check client 
IPs against different (Berkeley) databases. Ipqbdb gives a random 
answer for, say, between 2 and 4 attempts, similar to the way stockade 
works. See http://en.wikipedia.org/wiki/Stockade_%28software%29 for a 
short description of such rate limiting approach, 
https://savannah.nongnu.org/projects/ipqbdb/ for ipqbdb itself.

If you are specifically interested in blocking ssh, follow the 
"DenyHosts" link from the "See also" section of that wikipedia page.
