From: "J. Bakshi" <joydeep@infoservices.in>
Subject: Re: can we design a modified fail2ban ?
Date: Mon, 19 Apr 2010 08:46:00 +0530
Message-ID: <4BCBCAF0.9010407@infoservices.in>
References: <4BC7E028.8050209@infoservices.in> <alpine.LSU.2.01.1004160923230.31861@obet.zrqbmnf.qr> <4BC9DB51.6000407@tana.it>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BC9DB51.6000407@tana.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: vesely@tana.it
Cc: netfilter@vger.kernel.org

On 04/17/2010 09:31 PM, Alessandro Vesely wrote:
> On 16/Apr/10 09:28, Jan Engelhardt wrote:
>> On Friday 2010-04-16 05:57, J. Bakshi wrote:
>>>
>>> fail2ban is a popular application to prevent the brute-force attack
>>> against ssh and also against imap, pop3 etc.. But fail2ban actually
>>> blacklist the IP and this is what fail2ban has been designed for.
>>> Now a days [nowadays] we can design the same with iptables.
>>
>> fail2ban has the ability - if I read its own short description right
>> - to
>> already use various blocking methods, including not only /etc/hosts.=
deny
>> but also iptables.
>
> I don't think it uses netfilter, though. I've read it has to restart =
a
> daemon in order to unlist an IP --not sure it's still so for the
> current version.
>
>>> I wonder if iptables can
>>> provide more liberty to match IP as well as port combination so tha=
t we
>>> don't need to blacklist the IP but only block the attempts from the=
 IP
>>> based on port. Say more than 3 ssh attempt from IP xxx.xxx.xxx.xxx =
is
>>> detected and no more ssh attempt from the same ip is no more possib=
le
>>> but pop and imap still works. Is it really possible with iptables ?=
 Any
>>> idea ?
>
> The fail2ban doubts I mentioned above are the raison d'etre of ipqbdb=
=2E
> It matches IPs for responses, but it leaves it up to the sysadmin to
> configure iptables. For example, an admin may call the NFQUEUE rule
> only for ssh, so as to live pop3 and imap alone; or call NFQUEUE with
> a different queue-num for different services, so as to check client
> IPs against different (Berkeley) databases. Ipqbdb gives a random
> answer for, say, between 2 and 4 attempts, similar to the way stockad=
e
> works. See http://en.wikipedia.org/wiki/Stockade_%28software%29 for a
> short description of such rate limiting approach,
> https://savannah.nongnu.org/projects/ipqbdb/ for ipqbdb itself.
>
> If you are specifically interested in blocking ssh, follow the
> "DenyHosts" link from the "See also" section of that wikipedia page.
> --=20
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html
>


Hello,

thanks to all of you for your ideas and discussion. I am thank-full to
Richard Horton, who has shown me a great way to design iptables rules
which can work like fail2ban; not only that it can be extended in many
different ways for different purposes. Based on his suggestion I have
made these rule sets and it works as expected, i.e blocking ssh overflo=
w
but the other services i.e. apache, imap etc.. are still accessible.

````````````
# mark packets

iptables -A INPUT -p tcp -m hashlimit --hashlimit-above 2/min
--hashlimit-burst 2 --hashlimit-name hashlimit -m state --state NEW \
-m tcp --dport $SSH_PORT -j MARK --set-xmark 0x1/0xffffffff

# blacklisting interval
iptables -A INPUT -p tcp --dport $SSH_PORT -m recent --rcheck --seconds
60 --name sshoverflow --rsource -j DROP

# blacklist port only based on IP
iptables -A INPUT -p tcp --dport $SSH_PORT -m mark --mark 0x1 -m recent=
 \
--set --name sshoverflow --rsource -j DROP

# accept others
iptables -A INPUT -p tcp -m state --state NEW --dport $SSH_PORT -j ACCE=
PT

````````````

The only thing which is unusual here is the duration part. what ever
duration is defined here , practically becomes the double. I have teste=
d
with *time* command with different values and every time I have found
that in practical duration becomes double than what is defined . Except
that the rule sets are working well.

Thanks

--=20

=E0=A6=9C=E0=A7=9F=E0=A6=A6=E0=A7=80=E0=A6=AA =E0=A6=AC=E0=A6=95=E0=A7=8D=
=E0=A6=B8=E0=A7=80

