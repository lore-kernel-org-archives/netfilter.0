From: "azeem ahmad" <azeem484@hotmail.com>
Subject: ftp
Date: Wed, 19 May 2004 21:05:00 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY15-F30mEB4HGXAwx000684fd@hotmail.com>
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

hi all
i m unable to browse ftp. it says
---------------------------------------------------------------------------------------------------------------------------------------
an error occured opening that folder on the ftp server. make sure you have 
permissions to access that folder
details
200 type set to A
500 Illegal port command
500 LPRT not understood
--------------------------------------------------------------------------------------------------------------------------------------

while i m running with this only one iptables rule

iptables -t nat -A POSTROUTING -j MASQUERADE

there is no other rule in my firewall in any table any chain. every other 
things are being masqueraded well

Regards
Azeem

_________________________________________________________________
Add photos to your e-mail with MSN 8. Get 2 months FREE*. 
http://join.msn.com/?page=features/featuredemail


