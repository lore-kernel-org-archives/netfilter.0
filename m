From: Pete Whiting <pete@whitings.org>
Subject: how can I match the first packet after session is established
Date: Sat, 7 Feb 2009 16:58:42 -0700
Message-ID: <3ba156dd0902071558k299a0b7dicc14d0bc3c4a8a92@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I would like to match the first packet in a session after the
connection has been established. So, I'm not interested in the first
syn, the syn,ack and only the next ack if it is carrying data. I'm
trying to inspect the first host header in an http session but I am
not interested in any of the packets that follow.

Any suggestions on how to accomplish this?

thanks.
pete
