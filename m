From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: SUN RPC portmap
Date: Sat, 26 Jun 2004 11:51:04 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <SERVER7VjCRGryWtIIZ00000003@server7.bandwidthco.com>
References: <200406251600.i5PG0vD4005549@ylpvm29.prodigy.net>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406251600.i5PG0vD4005549@ylpvm29.prodigy.net>
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
To: 'Spiro Azkoul' <spiro@snacorp.net>, netfilter@lists.netfilter.org

 

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Spiro Azkoul
Sent: Friday, June 25, 2004 9:01 AM
To: netfilter@lists.netfilter.org
Subject: SUN RPC portmap

Can anyone think of a reason to simple block SUN RPC via iptables rather
than simply stopping the service if it is a mail/pop/imap/web server?
Thanks


It's normally referred to as "Defense-in-Depth". It is not recommended to
rely on a single method of security for anything. If the attacker gets
through the front line, it's always nice to know there is a second or third
or fourth, etc, etc, layer of defense to stop them.



