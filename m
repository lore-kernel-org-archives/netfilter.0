From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Send local traffic to a different server.
Date: Wed, 23 Jun 2004 10:20:50 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088000450.24595.28.camel@localhost>
References: <s0d956ae.099@GroupWise>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <s0d956ae.099@GroupWise>
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
To: Brett Simpson <Simpsonb@hillsboroughcounty.org>
Cc: netfilter@lists.netfilter.org

On Wed, 2004-06-23 at 10:08, Brett Simpson wrote:
> I've tried a number of different PREROUTING and POSTROUTING rules and can't seem to make this work.
> 
> I have a system with a single nic (eth0). While I'm on the system via a shell I would like to connect to 127.0.0.1:6000 and get seemlessly translated to 207.156.7.15:80.
> 
> I tried the following without success:
> 
> iptables -t nat -A PREROUTING  -p tcp -d 127.0.0.1   -i lo --dport 6000 -j DNAT--to-destination 207.156.7.15:80
> iptables -t nat -A POSTROUTING -p tcp -d 207.156.7.15 -o eth0 --dport 80 -j SNAT --to-source 127.0.0.1
Hmmm .  . . not sure, never tried it.  What happens if you move your
first rule to -t nat OUTPUT instead of -t nat PREROUTING?
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


