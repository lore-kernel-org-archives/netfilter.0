From: "Lohan Spies" <l.spies@petzetakis.co.za>
Subject: RE: open port to specific ip address
Date: Mon, 10 Nov 2003 14:01:42 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAHvCSmpkyA0+lP5YKpr7djsKAAAAQAAAAX5TmzymhnkKWYhlmn/VLAwEAAAAA@petzetakis-africa.co.za>
References: <200311101123.hAABN7j16772@agate.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311101123.hAABN7j16772@agate.rockstone.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: 'Antony Stone' <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

Anthony,

I tried this but it is not working! It is TCP

I want to map (internal) 10.10.10.41 port 15000 to (external)
196.2.147.208 port 80.
And then if anything from ip 196.2.147.208 port 80 comes back it must be
forwarded to 10.10.10.41 port 15000.

And then if I do this mapping will all cgi-scripting and authentication
be disabled?

Thanks,

Lohan

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
Sent: 10 November 2003 01:23 PM
To: netfilter@lists.netfilter.org
Subject: Re: open port to specific ip address


On Monday 10 November 2003 10:55 am, Lohan Spies wrote:

> Hi All,
>
> I need to know how will i open a specific port to a external ip 
> mapping!
>
> I need to specify a internal_ip:port on my internal network, and then 
> if someone connects to internal_ip:port it must redirect them to 
> external_ip with no cgi scripting and no authentication support!
>
> How will i do this?

ip addr add dev eth1 internal_ip
iptables -A PREROUTING -t nat -d internal_ip -p tcp --dport port -j DNAT
--to 
external_ip
iptables -A FORWARD -d external_ip -p tcp --dport port -j ACCEPT

I'm assuming TCP here since you didn't specify - if you need UDP instead

simply replace in both lines.   Also I've assumed eth1 is your internal 
interface - change if needed.

Antony.

-- 

It's a natural impulse to shape the random events we live through into 
coherent narrative, otherwise our lives would feel like experimental
theatre 
or abstract painting, which would be a complete bloody nightmare.

 - Pete McCarthy, The Road to McCarthy
                                                     Please reply to the
list;
                                                           please don't
CC me.

CONFIDENTIALITY CAUTION: If you have received this communication in error, please note that it is intended for the addressee only, is private and confidential and dissemination or copying prohibited. Please notify us immediately by e-mail and return the original message. We cannot assure that the integrity of this communication has been maintained nor that it is free of errors, virus, interception or interference. Thank you



