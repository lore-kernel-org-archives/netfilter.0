From: Georgi Alexandrov <georgi.alexandrov@gmail.com>
Subject: Re: tarpit before or after adding chain?
Date: Sat, 17 Dec 2005 11:13:31 +0200
Message-ID: <43A3D6BB.4010709@gmail.com>
References: <43A3ADF3.7050406@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43A3ADF3.7050406@comcast.net>
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
To: netfilter@lists.netfilter.org

Eric wrote:

> I'm a little confused about when to add the TARPIT trap.
>
> iptables -N SPECIAL # add special chain for tarpit usage
>
> *HERE*?
> iptables -A SPECIAL -p tcp -j TARPIT
>
> #
> # the following string match rules screen out nimda and other crap
> #
> iptables -A INPUT -i eth0 -p tcp  --dport 80 -m string --algo bm 
> --string "/default.ida?"     -j SPECIAL
> iptables -A INPUT -i eth0 -p tcp  --dport 80 -m string --algo bm 
> --string ".exe?/c+dir"       -j SPECIAL
> iptables -A INPUT -i eth0 -p tcp  --dport 80 -m string --algo bm 
> --string ".exe?/c+tftp"      -j SPECIAL
> iptables -A INPUT -i eth0 -p tcp  --dport 80 -m string --algo bm 
> --string "cmd.exe"           -j SPECIAL
> iptables -A INPUT -i eth0 -p tcp  --dport 80 -m string --algo bm 
> --string "vti_bin"           -j SPECIAL
> iptables -A INPUT -i eth0 -p tcp  --dport 80 -m string --algo bm 
> --string "nsiislog.dll"      -j SPECIAL
> iptables -A INPUT -i eth0 -p tcp  --dport 80 -m string --algo bm 
> --string "click-network.com" -j SPECIAL
>
> *OR HERE?*
> iptables -A SPECIAL -p tcp -j TARPIT
>
> Thanks
> Eric
>
>
And again ... why do you need all this, when you're running linux and 
those are no harm in any way to your system?
Or you are with those guys trying to complex their lifes every single day?

