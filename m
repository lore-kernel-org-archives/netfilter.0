From: "Venkatesh. K" <venkatesh@cbayscribe.com>
Subject: Re: Access VNC Server via DNAT
Date: Mon, 22 Sep 2003 13:32:34 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <012d01c380e0$0b35f120$2800a8c0@karu>
References: <bkhmas$bjt$1@sea.gmane.org>
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
Content-Type: text/plain; charset="us-ascii"
To: Joel Pearson <pearj@writeme.com>
Cc: netfilter@lists.netfilter.org

----- Original Message ----- 
From: "Joel Pearson" <pearj@writeme.com>
To: <netfilter@lists.netfilter.org>
Sent: Saturday, September 20, 2003 7:26 PM
Subject: Access VNC Server via DNAT


> Hey,
>
> I have a vnc server that is on my local lan at home that I'd like to be
able
> to access from the internet via my internet gateway linux box.  I've read
a
> little bit about it but I can't get my gateway to forward to ports, I've
> tried this:
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 5904 -s
192.168.0.2 -j
> DNAT --to 192.168.0.25:5904

If your internet interface is eth0, you need to do
/sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 5904 -j
DNAT --to-destination 192.168.0.25

Please note the above rule will allow you to connect only from internet.

> But it says it can't connect to the server. At the moment I'm just trying
to
> get the port forwarding to work on my local lan, but it doesn't seem to be
> working. I've read of people haveing this working using a somewhat similar
> iptables command, is there some module I'm supposed to load to make this
> happen?  My server is running RedHat 8 with iptables v1.2.6a
>
> Does anyone know why this isn't working?
>
> Thanks
>
> Joel
>

Venkatesh K


