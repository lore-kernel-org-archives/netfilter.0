From: 0ndrej <0@amu.cz>
Subject: rule to match next-hop
Date: Tue, 24 Dec 2002 10:50:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E082DF3.9050007@amu.cz>
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

Dear NetFilter Wizards,

We are building a volunteer network in Prague based on wireless 
broadband technology (WiFi and our cheep FSO deviced - see 
http://ronja.jikos.cz) - http://www.czfree.net and we would like to 
limit bandwith between our routers, as the 'broadband' is not that broad 
concerning WiFi....

Is there a way to match/clasify packets going via our meshed network to 
a certain nex-hop router?

example

      wlan0      wlan0  wlan1     wlan0  wlan1
<box a> --------- <box b> -------- <box c> --- ...
                           \------- <box d> --- ...
                            \------ <box e> --- ...

At <box b> we would like to mark packets going through interface wlan1 
via boxes c,d,e with different marks, such that we could make fair 
sharing of the available bandwith (QoS / HTB)
This means classifying packets based on their next-hop, but I couldnt 
find any way how to do it. I hope I'm just stupid and it is possible, so 
if anyone knows, please tell me :)

thanks, enjoy Xmass
0.



