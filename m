From: Victor Julien <victor@nk.nl>
Subject: Creating rules without the /sbin/iptables command?
Date: Wed, 17 Mar 2004 19:46:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40589CF8.8010007@nk.nl>
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

Hi,

I'm writing a tool for creating a rulesset. It's meant for users who do 
understand the way a firewall works, but don't have any 
netfilter-specific knowledge. It can output a bash-script or create the 
rules itself.

My program (written in c) creates rules by opening a pipe to 
/sbin/iptables. However this is quite slow with large rulessets and on 
slow hardware. Is there another way, like an iptables librarycall or 
something? I'm going to release the tool under the GPL soon, so that 
shouldn't be a problem.

Regards,
Victor

