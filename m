From: "Joel Lindsay" <joel@waveteq.com>
Subject: Cant find
Date: Mon, 2 Oct 2006 09:54:59 -0700
Message-ID: <009701c6e643$7f20ef60$4401a8c0@WINXPVIRUSMONITOR>
References: <BAY103-F25ED7B9242FA2718CEF385B21F0@phx.gbl><4520ED15.5090205@plouf.fr.eu.org>
	<20061002120137.GD23849@woyzeck><452110C1.2010203@plouf.fr.eu.org>
	<20061002141800.GE23849@woyzeck>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Keep getting the error.

iptables v1.2.11: Couldn't find target `MASQUERADE'

Using kernel 2.6.15-uc0 uclinux.

Have compiled as module and statically the following.

iptables support
connection tracking support
ip filter support
reject target support
full nat support
masquerading support

the module ipt_MASQUERADE exists and is loaded, but I keep getting this 
error.  I cant figure out why??

Is there more dependencies on some other modules?


Joel Lindsay, B.Eng
Project Engineer
Waveteq Communications
(250) 766-9229
----- Original Message ----- 
From: "Stefan Friedel" <stefan.friedel@iwr.uni-heidelberg.de>
To: "Pascal Hambourg" <pascal.mail@plouf.fr.eu.org>
Cc: <netfilter@lists.netfilter.org>
Sent: Monday, October 02, 2006 7:18 AM
Subject: Re: DNAT problem



