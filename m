From: "Meerz 70" <meerz70@hotmail.com>
Subject: Foolish question
Date: Sun, 16 Nov 2003 02:15:14 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Law9-F237wyfwjHNuQu00001416@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello List,
I am using RH 7.3 as a proxy serverin an ISP Enviornment.There is a problem 
with my users is that they are not able to use other services like voice 
chat, sms etc because of my firewall if I give following configuration in my 
ipchains it start browsing but stop other services
:input ACCEPT
:output ACCEPT
:forward ACCEPT
-A input -p tcp -s 0/0 -d 0/0 80 -j REDIRECT 8080
-A input -p tcp -s 0/0 -d x.x.x.x/255.255.255.240 80 -j ACCEPT

Please help in resolving this issue.I will be grate ful if some one give me 
configuration.

Regards

Shahnawaz

_________________________________________________________________
MSN 8 with e-mail virus protection service: 2 months FREE* 
http://join.msn.com/?page=features/virus


