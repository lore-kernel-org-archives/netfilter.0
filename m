From: "Jeremy Andrew" <corporate@superonline.com>
Subject: Packet Inspecting Filter with IPTables
Date: Thu, 26 Aug 2004 07:50:36 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <E1C0CDk-00009n-00@deer.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I wish to implement a feature on a linux box which I explained with detail
in the following text;

I have read about many different articles on how to take actions based on
the contains of a packet. I think netfilter/iptables has support of what I
wish to deploy on a Linux machine (kernel 2.4.20) acting as a gateway
network node. I have not found enough information about the exact steps to
be taken in order to;

- Inspect each and every incoming packet for a specific port (ftp as an
example), and then if the data packet contains a specific set of bits (ascii
characters "GLOB" e.g), take actions based on a predefined rule (send a
message to syslog) and then "drop" this packet.

Should I install a newer version than I currently have (iptables  v1.2.6a)
or does this version contain the feature I require? Indeed, I do not wish to
make an upgrade to iptables since this is a "production" environment, but I
can add another box only for this purpose, so even alpha / beta versions are
accepted. 

I would be glad if I see exact steps to take since I really do not have much
time to make a research on the matter right away. 

Regards...
 





