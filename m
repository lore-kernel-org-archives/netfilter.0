From: Stephen Hemminger <shemminger@vyatta.com>
Subject: Problems with nf_conntrack_sip and multiple
Date: Mon, 11 Oct 2010 12:29:40 -0700
Message-ID: <20101011122940.58f470bd@nehalam>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

We are seeing a problem where a second SIP session causes
the nf conntrack expectation table to be flushed.  It looks
like for SIP some reference counting is needed.

The traces all look like the following.  The important part
seems to be the second INVITE happening over the same session
pair.  This is all over UDP, and is using 2.6.32 kernel.

             .                                       .
10.128.00.62             204.9.06.06      204.9.06.05      10.128.00.120
  |                               |         |               |
  |  INVITE SDP                   |         |               |
  |------------------------------>|         |               |
  |                               |         |               |
  |  100 Trying                   |         |               |
  |<------------------------------|         |               |
  |                               |         |               |
  |  180 Ringing                  |         |               |
  |<------------------------------|         |               |
  |                               |         |               |
  |  200 OK SDP (telephone-event  |         |               |
  |<------------------------------|         |               |
  |                               |         |               |
  |        ACK                    |         |               |
  |------------------------------>|         |               |
  |                               |         |   RTP         |
  |                               |         |<=============>|
  |                               |         |               |
  |  INVITE SDP                   |         |               |
  |------------------------------>|         |               |
  |                               |         |               |
  |  100 Trying                   |         |               |
  |<------------------------------|         |               |
  |                               |         |               |
  |  180 Ringing                  |         |               |
  |<------------------------------|         |               |
  |                               |         |               |
  |   BYE                         |         |               |
  |------------------------------>|         |               |
  |                               |         |               |
  |   481 Call Does Not Exist     |         |               |
  |<------------------------------|         |               |
  |                               |         |               |
  |   200 OK SDP                  |         |               |
  |------------------------------>|         |               |
  |                               |         |               |
  |        ACK                    |         |               |
  |------------------------------>|         |               |
  |                               |         |               |
  |        BYE                    |         |               |
  |------------------------------>|         |               |
  |                               |         |               |
  |   200 OK SDP                  |         |               |
  |------------------------------>|         |               |
  |                               |         |               |
