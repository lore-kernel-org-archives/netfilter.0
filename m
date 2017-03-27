From: Robert White <rwhite@pobox.com>
Subject: Re: Allow connection on specific port only when other port is used
Date: Mon, 27 Mar 2017 17:58:14 +0000
Message-ID: <504d1c2b-6fbd-1e7d-aa2f-fbef2b8dc1a8@pobox.com>
References: <013001d2a6c7$5b5a8f50$120fadf0$@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <013001d2a6c7$5b5a8f50$120fadf0$@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: sbasan@bluebe.net, netfilter@vger.kernel.org

On 03/27/17 06:57, Sam Basan wrote:
> I couldn't find this issue on the web.
> I want to allow new connection on specific port (let's say FTP) only when
> there is active session in HTTP.
> It's like port knocking only I don't want to "knock" HTTP port but make sure
> it's active session and only then open the FTP port to this specific IP
> address.

DISCLAIMER: this response is extemporaneous. I haven't tested it, just
thought it out a little. YMMV.


You can do this pretty easily in nftables with a self-updating set.

table ip example {
	set allowable {
		type ipv4_addr
		flags timeout
	}

	chain trigger {
		tcp dport http set add ip saddr timeout 2m @allowable
	}

	chain gatekeeper {
		tcp dport ftp ip saddr @allowable accept
	}
}

This solution is self cleaning since the set membership has a fixed
duration.


In ipbables you could use the "--match recent" with a --set rule in one
place (the http path) and an --update --seconds nnn --reap in the other
(the ftp path). In this case the set will tend to grow without bounds
since it is only cleaned by FTP failures.

In all cases you have to use a timeout window instead of an "active
connection" as the HTTP socket will almost surely be closed by the time
the FTP action is invoked.

Understand that you are putting policy into these rules in a way that is
not bullet proof since even a trivial open of the http socket, such as
via an nmap scan, will effectively knock the FTP port open. It would be
"better" to do something system strong at the application layer.

--Rob.
