From: "Ralf Braga" <ralf@4linux.com.br>
Subject: to understand --tcp-flags
Date: Sat, 31 May 2003 19:10:58 -0300 (BRT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <36427.200.204.151.150.1054419058.squirrel@webmail.4linux.com.br>
References: <20030531140137.C16012@jmhowell.com>
Reply-To: ralf@4linux.com.br
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030531140137.C16012@jmhowell.com>
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
To: netfilter@lists.netfilter.org

Hi,

I dont understand this command:

iptables -A INPUT -p tcp --tcp-flags SYN,ACK SYN,ACK \
-m state --state NEW -j REJECT --reject-with tcp-reset

Because two times is used --tcp-flags SYN,ACK SYN,ACK ?


This example will be bloqued packages for flags syn and ack ?

Thanks,


__________________________
    Ralf Braga
    CIO
    Fone:55-0xx11-3889-0108
    Fax: 55-0xx11-3889-0108
    www.4linux.com.br
    ralf@4linux.com.br
___________________________
A SUA INTELIG=CANCIA EM LINUX



