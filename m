From: tengaman@wolke7.net
Subject: Re: NAT not for filtering - problem
Date: Wed, 18 Feb 2009 03:58:46 +0100
Message-ID: <20090218025846.GA5948@localhost>
References: <20090217152840.GA3683@localhost> <20090217232744.GA5471@localhost>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090217232744.GA5471@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

My own pondering results in some new, hopefully clearer questions:

How does the REDIRECTed packages look like?
I mean REDIRECT can't simply change the IP-destination-field into
127.0.0.1, because the proxy wouldn't know where to relay it, would it?

Is it true that this REDIRECTed packages, whatever they look like
go through the filter-output chain before being delivered locally to the
daemon-process?

If there exists detailed documentation on this matters please give me a
hint.

regards
Sebastian R.
