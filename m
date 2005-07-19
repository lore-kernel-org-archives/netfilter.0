From: Rob Carlson <rcarlson@kitchenandassociates.com>
Subject: Re: IPset ports question.
Date: Tue, 19 Jul 2005 16:58:15 -0400
Message-ID: <42DD6967.3050700@kitchenandassociates.com>
References: <42DBF833.9020505@kitchenandassociates.com>
	<Pine.LNX.4.58.0507191037060.22686@blackhole.kfki.hu>
	<42DD50E4.9090800@kitchenandassociates.com>
	<Pine.LNX.4.58.0507192204230.24449@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0507192204230.24449@blackhole.kfki.hu>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Netfilter User Mailing List <netfilter@lists.netfilter.org>

That did it.

Thanks again, Joszef

Jozsef Kadlecsik wrote:
> Hi Rob,
> 
> On Tue, 19 Jul 2005, Rob Carlson wrote:
> 
> 
>>iptables -A testset -m set --set testset src -j
>>LTREJECT
>>iptables -I FORWARD 2 -i eth1 -j testset
>>iptables -I INPUT 2 -i eth1 -j testset
>>
>>This works fine for blocking all traffic.  However
>>since I now want specifically to only drop port 22
>>and port 25 entries (that is most of the nuisance
>>traffic) and allow port 80 for example,  I did the
>>following:
>>
>>ipset -N ports portmap --from 1 --to 1024
>>ipset -A ports 22
>>ipset -A ports 25
>>ipset -B testset :default: -b ports
> 
> 
> You missed to replace the iptables command above with the one
> which instruct the SET target to follow bindings. What you need is
> 
> iptables -A testset -m set --set testset src,dst -j LTREJECT
> 
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
>           H-1525 Budapest 114, POB. 49, Hungary
> 
> 

-- 
Rob Carlson, Systems and Network Administrator
Kitchen & Associates Architectural Services, PA
Architecture - Planning - Interior Design
856.854.1880





