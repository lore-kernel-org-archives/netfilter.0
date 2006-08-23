From: =?ISO-8859-1?Q?Per_J=F8rgensen?= <pj4a@dmusyd.edu>
Subject: Re: Problem about LAN/DMZ
Date: Wed, 23 Aug 2006 10:03:23 +0200
Message-ID: <44EC0BCB.8050102@dmusyd.edu>
References: <44EB5BCA.2010504@dmusyd.edu> <44EC0A51.5000103@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44EC0A51.5000103@freemail.hu>
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
To: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>, netfilter@lists.netfilter.org

G=E1sp=E1r Lajos skrev:
> Per J=F8rgensen wrote:
>> Hey Netfilter!
>> I have been studying netfilter for several days now for building my=20
>> own firewall. But have ran into a problem and goes like this:
>> The machine Soekris 4801 Debian Sarge is my firewall
>> eth0 --> WAN --> Directly connected to the internet
>> eth1 --> LAN --> 172.16.0.0/24 --> eth1 address 0.1
>> eth2 --> DMZ --> 172.16.10.0/24 --> eth2 address 10.1
>> I have installed bind and are running perfectly and NSLOOKUP are=20
>> showing the coorectly things
>> In the zone file I have named the servers with their external IP.
>>
>> The IPTABLES script are an bash file with these rules for:
>> the interfaces:
>> lan:
>> $IPTABLES -A INPUT -i $LAN -m state --state NEW -j ACCEPT
>> dmz:
>> $IPTABLES -A dmz -m state --state ESTABLISHED,RELATED -j ACCEPT
>> $IPTABLES -A dmz -s $LAN_NET -m state --state NEW -j ACCEPT
>> wan:
>> $IPTABLES -A wan -m state --state ESTABLISHED,RELATED -j ACCEPT
>>
>> The connections:
>> lantowan:
>> $IPTABLES -A lantowan -s $LAN_NET -j ACCEPT
>> lantodmz:
>> $IPTABLES -A lantodmz -s $LAN_NET -j ACCEPT
>> dmztolan:
>> $IPTABLES -A dmztolan -o $LAN -m state --state ESTABLISHED,RELATED -j=20
>> ACCEPT
>> dmztowan:
>> $IPTABLES -A dmztolan -i $DMZ -o $WAN -p tcp --dport 25 -j ACCEPT
>> $IPTABLES -A dmztowan -o $WAN -m state --state ESTABLISHED,RELATED -j=20
>> ACCEPT
>> wantolan:
>> $IPTABLES -A wantolan -m state --state ESTABLISHED,RELATED -j ACCEPT
>> wantodmz:
>> ## HTTP ##
>> $IPTABLES -t nat -A PREROUTING -d $WAN_IP -p tcp --dport 80 -j DNAT=20
>> --to-destination $ATLANTIS:80
>> $IPTABLES -A wantodmz -d $ATLANTIS -p tcp --dport 80 -j ACCEPT
>> ## SSH ##
>> $IPTABLES -t nat -A PREROUTING -d $WAN_IP -p tcp --dport 22 -j DNAT=20
>> --to-destination $ATLANTIS:22
>> $IPTABLES -A wantodmz -s $SSH -d $ATLANTIS -p tcp --dport 22 -j ACCEPT
>> ## SMTP ##
>> $IPTABLES -t nat -A PREROUTING -d $WAN_IP -p tcp --dport 25 -j DNAT=20
>> --to-destination $ATLANTIS:25
>> $IPTABLES -A wantodmz -d $ATLANTIS -p tcp --dport 25 -j ACCEPT
>> ## IMAP ##
>> $IPTABLES -t nat -A PREROUTING -d $WAN_IP -p tcp --dport 143 -j DNAT=20
>> --to-destination $ATLANTIS:143
>> $IPTABLES -A wantodmz -d $ATLANTIS -p tcp --dport 143 -j ACCEPT
>>
>> the masquerade:
>> $IPTABLES -t nat -A POSTROUTING -s $DMZ_NET -o $WAN -j SNAT=20
>> --to-source $WAN_IP
>> $IPTABLES -t nat -A POSTROUTING -s $LAN_NET -o $WAN -j SNAT=20
>> --to-source $WAN_IP
>>
>> Apending the chains:
>> $IPTABLES -A INPUT -i $WAN -j wan
>> $IPTABLES -A INPUT -i $LAN -j lan
>> $IPTABLES -A INPUT -i $DMZ -j dmz
>> $IPTABLES -A FORWARD -i $WAN -o $DMZ -j wantodmz
>> $IPTABLES -A FORWARD -i $WAN -o $LAN -j wantolan
>> $IPTABLES -A FORWARD -i $DMZ -o $WAN -j dmztowan
>> $IPTABLES -A FORWARD -i $DMZ -o $LAN -j dmztolan
>> $IPTABLES -A FORWARD -i $LAN -o $DMZ -j lantodmz
>> $IPTABLES -A FORWARD -i $LAN -o $WAN -j lantowan
>>
>> The funny part is that it was working earliere today - And afterwards=20
>> setting it all up - I did a reboot  and deleted the uncommented=20
>> lines  -  (And perhaps  deleted an role) I have lost the look for=20
>> where this should be - and hopefully I'll be able to get some help=20
>> here????
>> Thanks
>>
> I have reordered and hopefuly repaired your script and added some=20
> comments:
>
> #eth0 --> WAN --> Directly connected to the internet
> #eth1 --> LAN --> 172.16.0.0/24 --> eth1 address 0.1
> #eth2 --> DMZ --> 172.16.10.0/24 --> eth2 address 10.1
>
> $IPTABLES -F nat
> $IPTABLES -X nat 2>/dev/null
>
> $IPTABLES -F filter
> $IPTABLES -X filter 2>/dev/null
>
> $IPTABLES -P nat PREROUTING ACCEPT
> $IPTABLES -P nat POSTROUTING ACCEPT
> $IPTABLES -P nat OUTPUT ACCEPT
>
> $IPTABLES -P filter INPUT DROP
> $IPTABLES -P filter FORWARD DROP
> $IPTABLES -P filter OUTPUT ACCEPT
>
> ## COMMON ##
>
> $IPTABLES -X connected 2>/dev/null
> $IPTABLES -A connected -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> ## NAT ##
>
> # PREROUTING #
>
> $IPTABLES -t nat -A PREROUTING  -d $WAN_IP -p tcp -m multiport=20
> --dports 22,25,80,143 -j DNAT --to-destination $ATLANTIS
> #$IPTABLES -t nat -A PREROUTING -d $WAN_IP -p tcp --dport 22 -j DNAT=20
> --to-destination $ATLANTIS:22
> #$IPTABLES -t nat -A PREROUTING -d $WAN_IP -p tcp --dport 25 -j DNAT=20
> --to-destination $ATLANTIS:25
> #$IPTABLES -t nat -A PREROUTING -d $WAN_IP -p tcp --dport 80 -j DNAT=20
> --to-destination $ATLANTIS:80
> #$IPTABLES -t nat -A PREROUTING -d $WAN_IP -p tcp --dport 143 -j DNAT=20
> --to-destination $ATLANTIS:143
>
> # POSTROUTING #
>
> $IPTABLES -t nat -A POSTROUTING -o $WAN -j SNAT --to-source $WAN_IP
> #$IPTABLES -t nat -A POSTROUTING -s $DMZ_NET -o $WAN -j SNAT=20
> --to-source $WAN_IP
> #$IPTABLES -t nat -A POSTROUTING -s $LAN_NET -o $WAN -j SNAT=20
> --to-source $WAN_IP
>
> ## FILTER ##
>
> # INPUT #
>
> $IPTABLES -A INPUT -j connected
> $IPTABLES -A INPUT -j ACCEPT ! -i $WAN
>
>
> #$IPTABLES -A wan -m state --state ESTABLISHED,RELATED -j ACCEPT
> #$IPTABLES -A INPUT -i $WAN -j wan
>
> #$IPTABLES -A INPUT -i $LAN -m state --state NEW -j ACCEPT
> #$IPTABLES -A INPUT -i $LAN -j lan
>
> #$IPTABLES -A dmz -m state --state ESTABLISHED,RELATED -j ACCEPT
> #$IPTABLES -A dmz -s $LAN_NET -m state --state NEW -j ACCEPT=20
> #?????????? Interface=3DDMZ AND Source=3D172.16.0.0/24 ????????????
> #$IPTABLES -A INPUT -i $DMZ -j dmz
>
> # FORWARD #
>
> $IPTABLES -A FORWARD -j connected
>
> $IPTABLES -X atlantis 2>/dev/null
> $IPTABLES -A atlantis
> $IPTABLES -A atlantis -p tcp --dport 22 -s $SSH -j ACCEPT
> $IPTABLES -A atlantis -p tcp --dport 25 -j ACCEPT
> $IPTABLES -A atlantis -p tcp --dport 80 -j ACCEPT
> $IPTABLES -A atlantis -p tcp --dport 143 -j ACCEPT
> $IPTABLES -X wantodmz 2>/dev/null
> $IPTABLES -A wantodmz -d $ATLANTIS -j atlantis
> $IPTABLES -A FORWARD -i $WAN -o $DMZ -j wantodmz
>
> #$IPTABLES -A wantolan -m state --state ESTABLISHED,RELATED -j ACCEPT
> #$IPTABLES -A FORWARD -i $WAN -o $LAN -j wantolan
>
> #$IPTABLES -A dmztowan -o $WAN -m state --state ESTABLISHED,RELATED -j=20
> ACCEPT
> #$IPTABLES -A FORWARD -i $DMZ -o $WAN -j dmztowan
>
> $IPTABLES -X dmztolan 2>/dev/null
> #$IPTABLES -A dmztolan -o $LAN -m state --state ESTABLISHED,RELATED -j=20
> ACCEPT
> #$IPTABLES -A dmztolan -i $DMZ -o $WAN -p tcp --dport 25 -j ACCEPT #=20
> !!!! NEVER GET USED !!!! -o $LAN OR -o $WAN ??????
> $IPTABLES -A dmztolan -i $DMZ -p tcp --dport 25 -j ACCEPT # THIS WORKS=20
> !!!
> $IPTABLES -A FORWARD -i $DMZ -o $LAN -j dmztolan
>
> $IPTABLES -X lantodmz 2>/dev/null
> $IPTABLES -A lantodmz -s $LAN_NET -j ACCEPT
> $IPTABLES -A FORWARD -i $LAN -o $DMZ -j lantodmz
>
> $IPTABLES -X lantowan 2>/dev/null
> $IPTABLES -A lantowan -s $LAN_NET -j ACCEPT
> $IPTABLES -A FORWARD -i $LAN -o $WAN -j lantowan
>
> Swifty
Thanks Swifty!
As I can see from your writing there=B4s still a lot of rewriting still=20
for mee to do!
I will try your script when I come home from school!

I added following line in my script late last night and got it to work.
$IPTABLES -t nat -A POSTROUTING -s $LAN_NET -d $ATLANTIS -j SNAT --to=20
$WAN_IP

But still I can see that there=B4s a lot to learn still for me - Good for=
=20
me I have now ordered the book from O=B4reilly
Thanks
Per J=F8rgensen

