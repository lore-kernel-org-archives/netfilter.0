From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: TPROXY and syn packets maybe a solution?
Date: Sun, 23 Nov 2014 15:20:00 +0200
Message-ID: <5471DF00.5020508@ngtech.co.il>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hey all,

I am using tproxy for quite some time and it works great on many kernels.
However TPROXY has a simple very unique nature.
TPROXY like REDIRECT or DNAT are passing the whole connection into the
proxy\service.
It causes that the "three way handshake" happens against the tproxy
and the origin service availability is unknown to the client.
The redirect and TPROXY modes are different but this is a similar issue.

I have seen that synproxy does something nice that might help with the
issue with a little modification.
Synproxy handles the initial syn packet and then kind of "splice" the
connections.
There is cost for this solution.

I don't know if this is the right place to think about the issue.
If you have any ideas, comments or notes please respond to the thread.

Eliezer Croitoru
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJUcd8AAAoJENxnfXtQ8ZQUUpIH/1M6jjwLqNLZ2yC2vkPNRL/h
Sp6oSSlW1g6+m8TVN/tkFNkqPZK2qbEOX4oFIiH2OoCnpMNn7vDEjR8OBPD2DKrw
9z/Y1ySl/MYU6/H7Sgswa7yebHS8OzKAzv4vioYUBpYKJ1BuRWJC/OiiBIQ87lVI
T/v/F7pHGyV8NR526HBK9v3JcW9FD3n4TZbEUcvvMZMJbe5USTtQiU5wn3mI0ZKj
7p4x7O4B+XOxRXJw225kUNJ89Tqv7Z6PWdUokKym3eEu66fBOME/Zf0s+93OiPTV
MwAU1nDJm2o3YnqMjO5wsiB8/srvZSU+aRcpujEcbkJm0/vogoMfoCUP3HhjLHk=
=67gb
-----END PGP SIGNATURE-----
