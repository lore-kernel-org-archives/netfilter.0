From: "Joel Pearson" <pearj@writeme.com>
Subject: Access VNC Server via DNAT
Date: Sat, 20 Sep 2003 23:56:41 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <bkhmas$bjt$1@sea.gmane.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hey,

I have a vnc server that is on my local lan at home that I'd like to be able
to access from the internet via my internet gateway linux box.  I've read a
little bit about it but I can't get my gateway to forward to ports, I've
tried this:
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 5904 -s 192.168.0.2 -j
DNAT --to 192.168.0.25:5904
But it says it can't connect to the server. At the moment I'm just trying to
get the port forwarding to work on my local lan, but it doesn't seem to be
working. I've read of people haveing this working using a somewhat similar
iptables command, is there some module I'm supposed to load to make this
happen?  My server is running RedHat 8 with iptables v1.2.6a

Does anyone know why this isn't working?

Thanks

Joel




