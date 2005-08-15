From: Barry Fawthrop <barry@ttienterprises.org>
Subject: Re: filtering ruleset help sought
Date: Mon, 15 Aug 2005 17:02:49 -0400
Message-ID: <430102F9.3070207@ttienterprises.org>
References: <4300FAAD.4060305@ttienterprises.org>
	<1124138954.21025.29.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=======AVGMAIL-430102F90FF7======="
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1124138954.21025.29.camel@localhost>
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
To: netfilter@lists.netfilter.org
Cc: jsullivan@opensourcedevel.com

--=======AVGMAIL-430102F90FF7=======
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Thanks John

Yes I want this machine and every other machine on the LAN to be denied 
access to the Internet except to the sites or IPs listed
in the allowed-hosts file

So could you help what addionional rules would I need ?



John A. Sullivan III wrote:

>Hmm . . .looks a little strange.  Do you want such access for this
>specific device or for other devices on the internal network that use
>this device as a gateway? The INPUT and OUTPUT chains will only handle
>traffic to and from this device.
>
>I would suggest you use connection tracking and you may find it easier
>to use DROP policies. Thus:
>
>$IPT -t filter -P INPUT DROP
>$IPT -t filter -P OUTPUT DROP
>$IPT -t filter -P FORWARD DROP
>$IPT -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>
>Then you can allow the outbound access including the protcol:
>
>while read s1 s2
>     do
>      $IPT -t filter -A OUTPUT -s $INNET -d $s1 -p 6 --dport 80 -j ACCEPT
>      $IPT -t filter -A OUTPUT -p icmp -s $INNET -d $s1 -j ACCEPT
>     done < /allowed-hosts
>  
>
also what is the -p 6 ???

>If you want to allow other devices to access these sites through this
>device, you will need rules in the FORWARD chain and probably an SNAT
>rule in the nat table POSTROUTING chain.  Good luck - John
>  
>
Thanks
Barry

--=======AVGMAIL-430102F90FF7=======
Content-Type: text/plain; x-avg=cert; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Content-Description: "AVG certification"

No virus found in this outgoing message.
Checked by AVG Anti-Virus.
Version: 7.0.338 / Virus Database: 267.10.9/72 - Release Date: 8/14/2005

--=======AVGMAIL-430102F90FF7=======--

