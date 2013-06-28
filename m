From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Dabase BAcked IPTables
Date: Fri, 28 Jun 2013 18:19:10 -0500
Message-ID: <20130628231910.GE10741@harrier.slackbuilds.org>
References: <CAGWRaZYZnq3bneKNdisrRAfk=9PvKD=cXVWN_b0ySVRMaPw9Dw@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGWRaZYZnq3bneKNdisrRAfk=9PvKD=cXVWN_b0ySVRMaPw9Dw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

On Fri, Jun 28, 2013 at 11:01:10AM -0400, Nick Khamis wrote:
> Is it possible to have a MySQL backed IPTables?

No, network packets need to be handled in real time. Your SQL query 
would take too long.

> What we are trying to accomplish is having our clients supply us 
> with a mac address (or ip), and we would let them through our core 
> network. This would be done automatically on our website i.e.:
> 
> * User logs into the website, and provides mac address
> * We insert the record in the database as an allow rule...

Sounds like a job for ipset(8).

> * Restart iptables?

Restart? What does that mean? iptables is not a daemon.
-- 
  http://rob0.nodns4.us/ -- system administration and consulting
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
