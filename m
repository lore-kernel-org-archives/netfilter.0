From: Ted Kaczmarek <tedkaz@optonline.net>
Subject: Excluding IP ranges from masquerade rules
Date: Mon, 13 Oct 2003 05:44:50 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1066038290.5801.35.camel@tarkus>
Reply-To: tedkaz@optonline.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I presently exclude 1 ip block in POSTROUTING using
"! X.X.X.X/24" . Is their a way to specify multiple ranges that are 
excluded?
or
Is their a way to have POSTROUTING only have affect on a certain
interface?

If anyone has a good link on this it would be appreciated, looked
through some of the docs already but their are many more :-)

Thanks,
Ted


