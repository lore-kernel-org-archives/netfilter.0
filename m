From: Frank.Mayer@knapp-systems.com
Subject: Antwort: Re: Antwort: Re: ipsets for both source and target in one
 iptables-rule?
Date: Fri, 2 Dec 2005 12:59:38 +0100
Message-ID: <OFC109A024.3BC7914A-ONC12570CB.0040CB45-C12570CB.0041E274@knapp.com>
References: <Pine.LNX.4.58.0512020838530.8267@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0512020838530.8267@blackhole.kfki.hu>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi Jozsef

I just realized that I now think I understand what you meant by "But why 
do you specify the protocol?"

I could have written the rule like
        iptables -A -m state --state ESTABLISHED -j ACCEPT

Best Regards and sorry for the misunderstandings,
Frank Mayer
UNIX Systemadministration
----------------------------------------------------
KNAPP Systemintegration GmbH
Waltenbachstrasse 9
8700 Leoben, Austria
----------------------------------------------------
Phone: +43 3842 805-921
Fax: +43 3842 82930-921
frank.mayer@knapp-systems.com
www.knapp.com


