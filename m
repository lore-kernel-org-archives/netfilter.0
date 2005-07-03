From: "Gary W. Smith" <gary@primeexalia.com>
Subject: Re: Crazy portmap request
Date: Sun, 03 Jul 2005 10:56:13 -0700
Message-ID: <BEED74CD.38AE%gary@primeexalia.com>
References: <Pine.LNX.4.61.0507031559120.901@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0507031559120.901@yvahk01.tjqt.qr>
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
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: netfilter@lists.netfilter.org

I understand what you are saying for the purposes of outgoing connections.
What I am looking for is SNAT the external interface so I can cannect to a
single, set port, on all 200 machines from an external workstation.

Basically, I'm at home right now and I should be able to walk 200 different
ports on the one static IP address and be able to access each of the 200
different machines at the remote office.  This is a simplified example.

The reality is, there are some 100+ servers running different SOAP objects
via a particular port on the end servers that we need to have accessible
from an external address.  We have a limited number of static IP's and don't
really want to waste 100 of them on individual servers.

It works with the rules individually, but it ends up being about 800 rules
in the file.  I was just hoping to trim it down a little.


On 7/3/05 7:02 AM, "Jan Engelhardt" <jengelh@linux01.gwdg.de> wrote:

>> Hello, 
>> 
>> I have a new challenge of trying to map some IP's to a single IP but
>> with a static port.  Here is a sample.
> 
> You can't do that (at least at the same time). This is because:
> What if the client-in-the-office makes two requests at the same time to the
> same service? (Classic example: SMB file sharing) Then you would have two
> distinct packets having the same single-IP-with-static-port on the source
> side, and IP-PORT on the destination side, e.g.
> 
>   client:1024  ->  fileserver:137
>   client:1025  ->  fileserver:137
> 
> gets mapped to
> 
>   router:1999 -> fileserver:137
>   router:1999 -> fileserver:137
> 
> and as you know, the uniqueness of a TCP connection is defined by the
> uniqueness of the tuple (srcip,srcport,dstip,dstport)
> 
>> Each workstation has a TCP processing running on a fixed port.  For all
>> intents and purposes let's say it's SMTP.  What I need to do, using the
>> single static IP address is map out a single port for each server behind
>> it.
>> 
>> So, given 10.99.0.x it we want something like this
>> 
>> 10.99.0.1:25 = 199.199.80.41:30001
>> 10.99.0.2:25 = 199.199.80.41:30002
>> ...
>> 10.99.0.250:25 = 199.199.80.41:30250
>> 
>> Is there a simple way to do this?  Currently we have a pre/post routing
>> line per entry.  Is there a better way?
> 
> Maybe I did not quite understand, but my first guess is -see above-.
> 
> For everything else, if it's only one connection at the same time,
>   -t nat -A POSTROUTING -s 10.99.0.1 -p tcp --sport 25 -j SNAT
>     --to-source 199.199.80.41:30001
> 
> 
> 
> Jan Engelhardt   
> --               
> | Gesellschaft fuer Wissenschaftliche Datenverarbeitung Goettingen,
> | Am Fassberg, 37077 Goettingen, www.gwdg.de


