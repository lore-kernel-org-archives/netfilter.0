From: Samuel =?iso-8859-1?B?RO1heiBHYXJj7WE=?= <samueldg@arcoscom.com>
Subject: Re: Firewall did not block SSH - what is wrong
Date: Tue, 22 Feb 2005 14:39:34 +0100
Message-ID: <20050222133934.2148.qmail@arcoscom.com>
References: <20050221203620.5c4484d7.Hilmar.Berger@gmx.de>
	<1109078739.421b32d3b20bd@webmail.kwsoft.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1109078739.421b32d3b20bd@webmail.kwsoft.de>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: lst_hoe01@kwsoft.de
Cc: netfilter@lists.netfilter.org

try something as: 

#Substitute values for yours.
#your iptables binary
IPT=3Diptables
#your external iface
EFACE=3Dppp0 

$IPT -A INPUT -i $EFACE -p tcp --dport ssh --syn -j DROP 


Say us if that is your need and if that works fine for you. 

lst_hoe01@kwsoft.de writes: 

> Zitat von Hilmar Berger <Hilmar.Berger@gmx.de>: 
> 
>>
>> Hi, 
>>
>> I am running iptables 1.2.11/Linux 2.4.27-pre2. Firewall is started wh=
en ADSL
>> connection is going up.
>> The rule set I use is from some example iptables ruleset to set up
>> IP-masquerading. I needed this sometime ago in order to connect my lap=
top to
>> my desktop and connect to internet through its dsl modem.
>> I never had any trouble with my firewall before. It worked as expected=
 - at
>> least that's what it seems to me. 
>>
>> Today someone tried to break in my machine (desktop, the one the firew=
all is
>> running on) by connection to sshd - which should have been blocked. I =
tried
>> to test if this was because my firewall rules are bad or because there=
 is
>> some other bug. Unfortunately, I don't have another machine around rig=
ht now
>> and iptables does not have the -C option that exists with ipchains to =
check
>> if the rules work as desired.
> 
> With this rule 
> 
> # remote interface, any source, going to permanent PPP address is valid
> #
> $IPTABLES -A INPUT -i $EXTIF -s $UNIVERSE -d $EXTIP -j ACCEPT 
> 
> and sshd bind to any interface you should not wonder why every one can =
connect
> to your firewall sshd and any other service running on the firewall ...=
 
> 
> Regards 
> 
> Andreas 
> 
>  
> 
 


Samuel D=EDaz Garc=ED=ADa
Director Gerente
ArcosCom Wireless, S.L.L. 

mailto:samueldg@arcoscom.com
http://www.arcoscom.com
m=F3vil: 651 93 72 48
tlfn.: 956 70 13 15
fax:   956 70 34 83 



