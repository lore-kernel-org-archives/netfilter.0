From: Ramoni <ramoni@databras.com.br>
Subject: Can iptables do this ?
Date: Fri, 2 Jan 2004 17:07:26 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040102190657.D959B1BF5F2@dtbnet02.databras.com.br>
References: <6.0.0.22.0.20040102224831.044036c0@amitpasari.com>
	<3FF5A9FB.7000302@nerim.net>
	<1073068231.18243.11.camel@e500>
	<20040102114623.79028242.mgale@utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040102114623.79028242.mgale@utilitran.com>
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

Hi,
can iptables do a temp rule ?
I mean, I need to create rules that will be deleted after x seconds or minutes.
The time module does not remove the rules as it is not supposed to do so.
Is there a module that I could say:
iptables -I FORWARD -s a.b.c.d -j DROP -m xxxxx --minutes 2
and the rule will be deleted after 2 minutes os something like that ?

thanx


