From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: External IP addresses on internal network
Date: Tue, 26 Aug 2003 11:57:08 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F4B8354.7040903@Loudoun-Fairfax.com>
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
To: netfilter@lists.netfilter.org

Hi all,

I recently updated my configuration by modifying one of my filter INPUT 
rules to specify source IPs coming in from the LAN:

iptables -t filter -A INPUT -p all -i $LAN_Interface -s $LAN_IP_Range -j 
Lan-Host

Packets not meeting this condition (among others) are logged and 
dropped. The intent is to catch any internal packets coming from an 
external IP address. No sooner did I load this rule when I started 
logging packets with an AOL IP address coming from the LAN interface 
going to port 53. I have a small LAN with only a handful of PCs which I 
configured myself, so I'm a bit puzzled.

Have I configured this wrong? Several users connect to AOL through the 
firewall so that's a possible cause, but I don't know why an AOL program 
would spoof IPs. Thoughts?


