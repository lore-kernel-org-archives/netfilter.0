From: HaTiM Chikhi <chikhi.hatim@gmail.com>
Subject: Configure NAT behaviors with iptables rules
Date: Mon, 16 Jun 2014 10:09:04 +0200
Message-ID: <CANim+DJuXzFw+zxMbzFvSVDkvqt5fhQZPehS-+ont0EKXd2nZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=A8jtxaqaYJq/fB51JXjpwIVFgqqe4W+Kg9QaufXkHAI=;
        b=gqbfV/Z0mQRhBqx3uSfw++BCoUjqV3nxkWUxErd4GV0ACe74u0VPtxAiBvU0CNLa4V
         GFFpiZZJN4oq+QfoYhs3eRnuvLj3PhLHIAy2a8hyEHSCsMT1pRm1wFq/O57FjXm8hGls
         ZIjZ0UAZfuiqlCVvYq3L53i3su8S4Kq49EiwZzPnKcovpa52jIpq54zbOobQ6j0CsSo6
         wWOGQCK0OrjhrO6jUcZVEduCl86rrP43GJ9zdbhLb639ysJT6vzlIb1+Ipe2vt34iUUJ
         w/SgD6w8kNjrQptnOx64QrT3qIaaN8UFdpcl7x62azqSL0dOOoQ18OV9cInTLPxUZjTc
         45Iw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi everyone,

I want to configure advanced NAT behaviors which are:
Maping behavior (Endpoint-Independent, Address-dependent, address and
port dependent),
IP Address Pooling Behavior (Arbitrary, Paired),
Port Assignment (Port preservation, No port preservation, port overload=
ing).
These terms are defined in the RFC4787.


Examples:
1- iptables -t nat -A POSTROUTING -o eth1 -j SNAT =E2=80=93to-source
193.49.142.107:2000-4000
Here I think the default behavior of NAT implemented by iptables is
Endpoint independent.
So all sessions will have the same 'external' (IP, Port N=C2=B0) even t=
here
is a range of ports.
I need to know what are the flags or options to be modified in order
to switch from a behavior to an other.


2- iptables -t nat -A POSTROUTING -o eth1 -j SNAT =E2=80=93to-source
193.49.142.107-193.49.142.150:
2000-4000
I think the default behavior is No Port Preservation and Paired.
Same question, how can I configure the other behaviors (Port
Preservation and Port Overloading)?


Here is a brief definition of each behavior:
* Mapping behavior:
=46or session originated on the same address and port (from the same ma=
chine).
- Endpoint Independent
Same mapping to different sessions.
The NAT router affects the same (IP address, Port number) to different =
sessions.
- Address dependent
Same mapping to sessions destined to the same host.
=46or sessions to different hosts, only the external IP address is the
same but port numbers are different.
=46or sessions destined to the same host, the NAT router affects the
same (IP address, Port N=C2=B0). Destination port differentiates betwee=
n
the 2 sessions.
- Address and Port Dependent
A mapping only applies to one session. The NAT router affects
different external (IP Address, Port N=C2=B0) for each session.

* IP Address Pooling Behavior:
NATs with a pool of external IP addresses.
- Arbitrary: an endpoint may have simultaneous mappings corresponding
to different external IP addresses of the NAT. Two sessions to the
same host may have different external IP addresses.
- Paired: same external IP address of the NAT.

* Port Assignment:
- Port Preservation
  Preserves the port as long as there are available IP addresses in
the NAT=E2=80=99s pool.
- No Port Preservation
 Two sessions can be established to different hosts using the same
external IP address in the NAT=E2=80=99s pool. But port numbers are dif=
ferent.
- Port Overloading
  The port is preserved always, even without available IP addresses in
the NAT=E2=80=99s pool.
 The NAT relays on the IP source of the response.



Thank you in advance and sorry for the long message.
