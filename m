From: Jamal Hadi Salim <jhs@mojatatu.com>
Subject: ANNOUNCE: New talk! Kernel HTTP/TCP/IP stack for HTTP DDoS mitigation
Date: Fri, 10 Mar 2017 05:55:41 -0500
Message-ID: <f3ea5850-377c-4c18-c164-6297488ff404@mojatatu.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=/H7f49wXGjAzESSClw+xRSK5q2Sp0HTfMXJmk3UVN0U=;
        b=W158LcIlksWbqYVTQl5o5yzt58R+oYZNcBb5db1X2SUprXrbvfqGOtI2trufmmNUUe
         YO8he107/K5fhYvXaT/p0lxs2sJAn1JkY9y1UIrqxgHTWUX5w6/zLYT6nXmWLSXTd2GP
         joonE2ZNUuVhhDvMYoTG3EV8awhbsgLUAYHeNX27v7Abd10bDsHAfcbeT5sRjtJ5fnpw
         ozCol4+nYgsRRb6aImbOej/6/Vr6PcRMMpi/Tfo2+lAZyK41xoGvQfPsNaT4+CF33UXr
         RpxipOSqs1JsmEuienKqohxN+3x9XPZHQurk333JmXtwWAOerolbMTk5ehhh7FOHjqna
         V4ZQ==
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: people@netdevconf.org
Cc: tech-committee@netdevconf.org, netfilter-devel@vger.kernel.org, Brenda Butler <bjb@mojatatu.com>, Stephen Jaworski <jaws@mojatatu.com>, netfilter@vger.kernel.org

The tech committee would like to announce a new accepted talk along one
of the main themes of netdev 2.1: DDOS.
Alexander Krizhanovsky will be talking about a Kernel HTTP
implementation designed to deal with HTTP DDoS attacks titled
"Kernel HTTP/TCP/IP stack for HTTP DDoS mitigation"


The description is as follows:
----
Application layer HTTP DDoS attacks are usually mitigated by HTTP
accelerators or HTTP load balancers. However, the Linux socket
interface doesn't provide reasonable performance for extreme loads
caused by DDoS attacks.

HTTP servers that are based on userland TCP/IP stacks are becoming
popular because they provide better performance. However, it is
worth noting that the TCP/IP stack is basically a huge
and complex piece of code which took years to make robust; so it's
not wise to implement in user space or run it twice (in  user and
kernel spaces). The other advantage of the kernel TCP/IP stack is that
is also well integrated with many powerful tools  like IPTables, IPVS,
tc, tcpdump and many others. These tools are unavailable for a user
space TCP/IP stack or require funky complex interfaces.

This talk describes Tempesta FW [1] which introduces HTTPS processing
to the kernel. HTTPS is built into Linux TCP/IP stack. As an HTTP
firewall, Tempesta FW implements reach set of rate limits and
heuristics to defend against HTTPS floods and Slow HTTP attacks. Also
HTTP cookie challenge is implemented, JavaScript challenge and several
other more advanced DDoS mitigation techniques are in development now.

Due to the infamy of TLS handshake DDoS attacks, it makes sense to
perform TLS handshake in the kernel to be able to establish TLS
connections as soon as possible. While TLS is very complex code, it
doesn't require complex locking, advanced memory management and so on.
It only took 1 human month for us to move TLS [2] with all necessary
HTTPS interfaces to the kernel. Thus, it's easier to move TLS to the
kernel than than it is to move TCP/IP stack to user space.

To reduce the amount of HTTP processing logic in the kernel we propose
efficient zero-copy kernel-user space transport for HTTP messages. For
example, HTTP compression, which isn't crucial for HTTP operation, is
considered to be implemented in user-space using the transport.

Tempesta FW's benchmarks [3] show that it processes HTTP messages as
quickly as an HTTP server using user space TCP/IP. Thus, bypassing
Linux TCP/IP isn=E2=80=99t the only way to get a fast Web server.

[1]. Tempesta FW's source code, https://github.com/tempesta-tech/tempesta

[2]. mbed TLS, https://tls.mbed.org/

[3]. https://github.com/tempesta-tech/tempesta/wiki/Tempesta-FW-benchmark
----

cheers,
jamal
--
To unsubscribe from this list: send the line "unsubscribe netfilter-devel" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
