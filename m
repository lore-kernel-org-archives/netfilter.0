From: unor <unorlist@yahoo.com>
Subject: logging/preventing RST as in US-CERT TA04-111A
Date: Thu, 22 Apr 2004 06:27:01 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040422132701.87006.qmail@web21411.mail.yahoo.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Will something like:

$IPTABLES -A INPUT -p tcp --tcp-flags RST -m state
--state NEW -j LOG

Log "RST injection" packets potentially explointing
that mentioned in US-CERT TA04-111A?  If not, any
ideas?

Thanks for the feedback.

Earl


=09
	=09
__________________________________
Do you Yahoo!?
Yahoo! Photos: High-quality 4x6 digital prints for 25=A2
http://photos.yahoo.com/ph/print_splash

