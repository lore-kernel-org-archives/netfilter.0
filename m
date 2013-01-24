From: David Gubler <dg@doodle.com>
Subject: Re: connlimit reached - cannot open connections even after I close
 some
Date: Thu, 24 Jan 2013 16:08:15 +0100
Message-ID: <51014E5F.9070804@doodle.com>
References: <77346cbd-787d-4e7e-a918-d1b858d56b25@me.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <77346cbd-787d-4e7e-a918-d1b858d56b25@me.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi Bryan,

 > I would think you could approach the problem by using apache's builtin
 > rate limiting function,

Yes we're using Apache and I researched that as well, but:

First, I'm thinking that an Apache module cannot reliably enforce a 
connection limit - after all, the module can only act *after* the 
connection has been established.

Second, I have not found an apache module that is included in Debian 
(required for automatic security updates) and is able to do that.
* mod_limitipconn is not available for Debian (it seems)
* mod_bw cannot limit connections per IP, only per scope
* mod_evasive counts hits on an object, not parallel connections
However, if you can point me to one I would give it a try anyway.

And after all, it really bugs me that apparently connlimit is supposed 
to do what I want, but shows this erratic behavior...

David

-- 
David Gubler
Senior Software & Operations Engineer
MeetMe: http://doodle.com/david
E-Mail: dg@doodle.com
