From: Giovane <gcmmoura@gmail.com>
Subject: on-the-fly routing decision (is it possible?)
Date: Thu, 3 Mar 2011 16:05:30 +0100
Message-ID: <AANLkTimr_47c6LYG1xcjOidFRhfNMY8R-f0qV3zaRy4H@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=B84cvf1+wZYA4uS4Rp6ERyzeEFg7a/uMMJev17lwR3g=;
        b=XTuuBfsuCI1+N/tEdjglP05F3BrjXZx3pZEwBG1g0J/Td7XYwTW5BOMgPKh04s6JVs
         NCZehI+kAvUVlNGZI53kcpPcqsMcxsQU9RRfdNegq3oi85Yosr3yiY8XAIbU9l3cnyYY
         Uz1CcqohfPn2HX9JE98w+RVTLeNYkVPUqSHUY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi,

I've got a problem which I would like to know how to make it work.

-------------------                                      --------------=
-------
|=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |  =
                                    |
                 |
| Computer=A0=A0=A0 eth0------------------fh0  | Computer   |
|=A0=A0=A0=A0=A0 A=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |            =
                          |
     B        |
|=A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =A0  |        =
                             |
                 |
|=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 eth1--=
---------------- fth1|                         |
|                      |                                      |
                 |
-----------------                                       ---------------=
-----

We've got initially:

a) A IP connectivity in all interfaces -- they are all on the same
network range.
b) A TCP connection between eth0 and fh0. Data is being send from eth0 =
to fh0.
c) TCP ACK rfrom fh0 goes to eth0

What I want to do:

a) after the connection is established, I want that the data to flow
from eth0 to fth1. (instead of from eth0 to fh0).

Shortcomings:
* How to make computer A to forward all outgoing data from eth0 to
eth1 , on  a already established TCP Connection?
* How to make computer B receive the data in fth1 and  forward to fh0,
where the socket is attached to?

What I've tried
 * Change the route on the fly on Computer A: add a route on the fly
 * Some rules with iptabes : did not work
 * This does not wok on the fly. It works if you set up before and
then start up the TCP connection.

Question:
  * Would ebtables/brouter work for this purpose that? Would iptables?
Any suggestions?

Purposes of this:
Scientific experiment on high-availability

Thanks a lot in advance,

Giovane Moura
