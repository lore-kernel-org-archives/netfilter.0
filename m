From: David Gubler <dg@doodle.com>
Subject: Re: connlimit reached - cannot open connections even after I close
 some
Date: Mon, 28 Jan 2013 17:17:16 +0100
Message-ID: <5106A48C.7080604@doodle.com>
References: <77346cbd-787d-4e7e-a918-d1b858d56b25@me.com> <51014E5F.9070804@doodle.com> <CAHn-yPwtNh6sSo0PMScgavbgS=5mmLGaUHmQrj4wJQxMj4pWpA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAHn-yPwtNh6sSo0PMScgavbgS=5mmLGaUHmQrj4wJQxMj4pWpA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi Nehal,

> I am not expert in this but mod_qos is definitely worth a try.

I have just tried 10.8 (from Debian testing) and 10.13 (from unstable) 
by back-porting them to Debian stable. They seem to work basically, but 
IPv6 support is broken, at least for the directive QS_SrvMaxConnPerIP 
(all IPv6 connections are treated as if they were coming from 
255.255.255.255, thus IPv6 connections wrongly hit the limit all the 
time). Thus not usable :(

david

-- 
David Gubler
Senior Software & Operations Engineer
MeetMe: http://doodle.com/david
E-Mail: dg@doodle.com
