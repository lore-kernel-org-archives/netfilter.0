From: Pascal Italiaander <pc-secure@home.nl>
Subject: Re: Ip handling
Date: Thu, 19 Jun 2003 01:51:40 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200306190151.40336.pc-secure@home.nl>
References: <7C9884991ADAE0479C14F10C858BCDF5122DDB@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF5122DDB@alderaan.smgtec.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

You wrote:
> Does anyone know of a way to make say all connections from the outside
> going to my outside IP address Appear to be coming from my local lan of
> 192.168.0.1

Did you know that this is spoofing ??

So you want to allow spoofing , bad idea.

To aproach your problem, I would rather match on MAC address.

example:

iptables -I INPUT -p all -m mac --mac-source 10:20:30:40:05:06 -m \
	state state NEW -j ACCEPT
iptables -I OUTPUT -p all -m state ESTABLISHED,RELATED -j ACCEPT

have fun

Pascal

 




