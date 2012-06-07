From: jonetsu <jonetsu@teksavvy.com>
Subject: conntrackd config syntax inflexibility
Date: Wed, 6 Jun 2012 21:03:58 -0400
Message-ID: <20120606210358.089a4bc8@mistral.stie>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

  I'm using 0.9.14 to try out the stateful firewall feature, along
  with keepalived.  Trying out first the most simple 'notrack' option.
  Copied the provided config file, modified interfaces and IP
  addresses.  Problem is, conntrackd gives a syntax error when an
  interface in contrackd.conf is either:

  Interface fe-3-1

  or:

  Interface te1-5-1c02ppp

  Is there any plan to allow more flexible interface names ?

Thanks.
