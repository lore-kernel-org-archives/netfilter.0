From: Roberto Nibali <ratz@tac.ch>
Subject: Re: concurrent connections
Date: Wed, 06 Nov 2002 12:56:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DC90380.8000703@tac.ch>
References: <A590F7F751E6D6118C0800104B0DF37304CDAF@MAILGATE>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Naleendra@dms.lanka.net
Cc: netfilter@lists.netfilter.org

Hello,

>         I have a customer of mine who needs a firewalling solution. 
> However they have given specification guidelines such as,
> 
>         170 Mbps throughput
>         125,000 simultaneos connections

How many rules do you expect to have and how many NICs are involved? How long do 
those 125000 simultaneous connections last in an average case?

>         I looked up the Cisco site & they have products to support this. 
> Only thing to note  was the micro-processor & Memory which varied from 
> AMD 133 to Intel 1Ghz for their range of models. In order to match this

I seriously doubt that an AMD133 could perform that well.

> what is the spec that I could go for in the Linux Server. Is their any 
> sort of yard-stick or rule of thumb for this purpose ?

It all depends a little bit on the design you're going to have. I mean it is 
perfectly ok to filter 170 Mbps on a Linux box provided you don't have state 
match and a lot of rules and probably LSM in your kernel.

You will definitely need a lot of testing before you can actually sell your box 
but someone with such giant requirements certainly has enough money to pay you a 
test environment too. At least that's what I've experienced with such customers.

Also you might need a buttload of memory for such a system. Assume for example 
that one connection needs only 256 bytes and it will only last for 30 seconds 
you would have (as a worst case with a 30 second peak rate):

ratz@zar:~ > echo "125000*256*30/1024/1024" | bc -l
915.52734375000000000000
ratz@zar:~ >

That would be MBytes ;), provided I didn't misinterprete something and that bc 
works correctly. I mean nothing is really impossible as we stride towards better 
kernels and high end servers.

Best regards,
Roberto Nibali, ratz
-- 
echo '[q]sa[ln0=aln256%Pln256/snlbx]sb3135071790101768542287578439snlbxq' | dc


