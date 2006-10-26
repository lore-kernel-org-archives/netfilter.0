From: Don Gould <don@bowenvale.co.nz>
Subject: Re: IPTables script problem...
Date: Fri, 27 Oct 2006 12:12:01 +1300
Message-ID: <454140C1.6010201@bowenvale.co.nz>
References: <4540847B.8080407@bowenvale.co.nz> <4540A4DB.6080001@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4540A4DB.6080001@freemail.hu>
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
To: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Cc: netfilter@lists.netfilter.org

Thanks :)

With help from a few others I found the answer...

you need sudo to do this.

See:  www.tcn.bowenvale.co.nz - my web site, if you're interested in=20
following the progress.

What I'm working on will be gpl

Cheers Don

G=E1sp=E1r Lajos wrote:
> Don Gould =EDrta:
>> Can anyone tell me why this isn't working?
>>
> ...
>>
>> [root@bowenvale shared]# cat dhcp.src
>> #!/bin/sh
> For debug try this:
>=20
> #!/bin/bash -x
>=20
>> nowdate=3D$(date)
>> # echo $nowdate, $0, $1, $2, $3 >> /home/shared/dhcpconnect.log
>>
>> echo $nowdate, $2, $3 >> /home/shared/dhcpconnect.log
>>
>> echo "Start" >> /home/shared/dhcpconnect.log
>>
>> mysql -h bowenvale -u oncs -pbutterfly -e "INSERT INTO
>> oncs.tblSessionRequest (MACAddress, IPAddress) VALUES('$2', '$3
>>    ');" &> /home/shared/dhcpconnect.log
> hmm...
> You mean:
> &>>/home
> ???
>> echo "Done - database log" >> /home/shared/dhcpconnect.log
>>
>> # Now we start the data accounting bit using IP tables...
>> # Make sure the iptables rules exist!  This should return errors becau=
se
>> these rules should always already exist.
>> iptables -N traffic_in  >> /home/shared/dhcpconnect.log
>> iptables -N traffic_out  >> /home/shared/dhcpconnect.log
>>
>> echo $nowdate, $2, $3 >> /home/shared/dhcpconnect.log
>>
>> echo "Done - rule create" >> /home/shared/dhcpconnect.log
>>
>> # Create Rule for IP to count the data.
>> iptables -A traffic_in -d $3  >> /home/shared/dhcpconnect.log
>> iptables -A traffic_out -s $3  >> /home/shared/dhcpconnect.log
>>
>> echo "Done - counter add" >> /home/shared/dhcpconnect.log
>>
>> #add chains as target to FORWARD rule - after the first time, this
>> should always be already done.
>> iptables -I FORWARD 1 -j traffic_in  >> /home/shared/dhcpconnect.log
>> iptables -I FORWARD 2 -j traffic_out  >> /home/shared/dhcpconnect.log
>>
>>
>> echo "Done forward rule add" >> /home/shared/dhcpconnect.log
>>
>> echo "Done", $2, $3  >> /home/shared/dhcpconnect.log
>>
> What is in dhcpconnect.log ??? :)
> Could you post it? :)
>=20
> Swifty

--=20
Don Gould
www.thinkdesignprint.co.nz - www.tcn.bowenvale.co.nz -=20
www.bowenvale.co.nz - www.hearingbooks.co.nz - www.buxtonsquare.co.nz -=20
SkypeMe:  ThinkDesignPrint - Good ideas:  www.solarking.co.nz


