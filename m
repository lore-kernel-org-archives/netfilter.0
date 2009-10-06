From: "Beyer, Philipp" <Philipp.Beyer@alliedvisiontec.com>
Subject: RE: evaluating kernel-mode packet processing (netfilter target extension?)
Date: Tue, 6 Oct 2009 17:34:41 +0200
Message-ID: <96837AF99C543646B54E8DA1A0315D5677B187@ahr-mail.avtnet.local>
References: <96837AF99C543646B54E8DA1A0315D5677B183@ahr-mail.avtnet.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <96837AF99C543646B54E8DA1A0315D5677B183@ahr-mail.avtnet.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

 
Having read some more, I think a bridging network driver could be the thing I'm looking for, although I don't need any bridging functionality at all.

Could anyone tell me if this concept is reasonable, pragmatic, bad or even impossible:

- Writing a bridging network driver, meant to be connected only to a single physical NIC.
- Consuming all UDP packets I'm interested in, managing some buffers inside the 'bridging driver' to be filled with these packets' payload
- Setting up some kind of streaming to send these buffers to user space
- Simply passing all 'other' network traffic through the bridging driver.


