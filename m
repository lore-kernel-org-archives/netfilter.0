From: Maximilian Wilhelm <max@rfc2324.org>
Subject: Re: iptables NAT routing issues
Date: Wed, 9 May 2007 00:37:36 +0200
Message-ID: <20070508223736.GC23200@outback.rfc2324.org>
References: <4640E893.1010206@bserved.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4640E893.1010206@bserved.nl>
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
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

Am Tuesday, den  8 May hub Bas Verhoeven folgendes in die Tasten:

Hi!

> We're having some problems with iptables, have been playing ~3 hours 
> with this and I need some advice.

> We want to 'forward' port 80 from one ip to another ip (other server) - 
> mainly to protect the webserver. One could say that you could use basic 
> portforwarding for this, but as far as i know this also breaks the 
> source ip for apache logs, etc. So we decided that we needed NAT'ing.
[...]

> OUTBOUND SERVER:

> iptables -t nat -A PREROUTING -p tcp --dport 80 -d <ext_web_ip> -j DNAT 
> --to-destination <webserver_ip>:80

That´s fine.
This will also make netfilter care of answer packages.

> Note: We didn't touch this as it seems to works fine.
> 
> WEBSERVER:
[...]
There are no NAT rules needed here.
All you have to accomplish is that the answer packages from WEBSERVER
to $client are routed via OUTBOUND SERVER.

I guess that´s just true by the network architecture.

e.g.

client network / inet  <--->  OUTBOUND SERVER  <->  WEBSERVER

HTH
Ciao
Max
-- 
	Follow the white penguin.

