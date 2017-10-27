From: Leonardo Bruno <leonardo@cefetmg.br>
Subject: How to enable Xen VM traffic using nft
Date: Fri, 27 Oct 2017 18:55:41 -0200
Message-ID: <1509137741.13003.0.camel@cefetmg.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi guys.

I am running Xen 4.8.1 and Debian 9 'stretch' as Dom0. I am also
using  
'nft' instead of 'iptables' as Debian is now encouraging the users to  
do.

The 'xen-scripts' shipped with Debian Xen packages add rules to
permit  
(accept) packages to/from virtual interfaces to flow in/out through  
the bridge interface.

But these scripts are not 'nft-ready' and, although it is simple to  
modify it in order to run the correct 'nft' commands, I could not  
translate the original 'iptables' rules to 'nftables' rules.

The 'iptables' commands executed when the VM is started (supposing a  
virtual interface 'vif0') are:

iptables -I FORWARD -m physdev --physdev-is-bridged --physdev-in vif0  
-j ACCEPT
iptables -I FORWARD -m physdev --physdev-is-bridged --physdev-out
vif0  
-j ACCEPT

Almost the same commands are executed when the VM is shutted down:

iptables -D FORWARD -m physdev --physdev-is-bridged --physdev-in vif0  
-j ACCEPT
iptables -D FORWARD -m physdev --physdev-is-bridged --physdev-out
vif0  
-j ACCEPT

Can someone help? Thanks in advance.

Best regards,
Leonardo Lopes

-- 
Esta mensagem foi verificada pelo sistema de antivírus e
 acredita-se estar livre de perigo.

