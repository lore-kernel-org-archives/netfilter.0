From: Vincent Mortellaro <vincent_mortellaro@mac.com>
Subject: NFS Client/Server Firewall.
Date: Sun, 23 Nov 2003 17:03:45 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E870E2C2-1E00-11D8-94DF-0003934F91C0@mac.com>
Mime-Version: 1.0 (Apple Message framework v606)
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

Hi,

I recently tried setting up an NFS server in my LAN and I've already 
nailed down the necessary ports so that lockd, statd, rquota and mountd 
now occupied ports 4000-4003. I did the same thing with clients just in 
case it would be necessary for running iptables there too. I setup 
iptables on the server using suse's yast tool, and then editing their 
susefirewall2 script to allow these ports: 2049, 111, 4000:4003 and the 
server worked fine - all of my clients could access it. However, when I 
went to firewall my clients (again using yast to configure iptables 
with the same ports) I couldn't connect to my server. Instead it gave 
an error message of "RPC: Timed Out".

I'd be more than happy writting my own iptables ruleset however I'm 
unsure as to what needs to be allowed by default for linux to work 
thats why I used yast to just add-in the parts I thought I needed. If 
anyone could give any advise about what I'm doing wrong or how I could 
setup iptables myself with rules that would protect both my nfs/samba 
server and my normal clients I'd appreciate it greatly.

Vincent


