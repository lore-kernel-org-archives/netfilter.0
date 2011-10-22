From: "p. awa" <pawa@tormail.net>
Subject: tag process's future sockets for iptables rules?
Date: Sat, 22 Oct 2011 14:44:53 +0000
Message-ID: <1RHcoO-000PCl-R6@internal.tormail.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tormail.net; s=tm;
	h=Message-Id:X-TorMail-User:Content-Type:MIME-Version:Subject:To:From:Date; bh=a5gKzL2Ik4ku9ZnSOiqdh67ex6PIsGhVvuZNtsrkvAg=;
	b=ciXZiPg+RfFwNMU4EZVrcT4pi2FgfHPigjlbVZh8M97nZvsS+LLZ7mgHH0wLVkTlTkYJkqZ0QdzKXAwptX1GfcGcO9simPzqmgk3lJZ0s2/b4P7LwG9H6McyI+59w8JBcHHvO7Zr6jiQjo/rLuHEdOGHjsUOiBtPA+3PRNj2LFk=;
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

i used to do redirection and filtering based on the uid of a packet's
local socket. the point was to transparently proxy an arbitrary process's
outbound tcp connections through tor[1]. it had a nice enough interface:

$ sudo torified-user wget http://example.com/

then i switched to filtering based on gid instead of uid: having only
the gid of regular files created by a process screwed with was less
intrusive. but it is all still a hack that becomes unwieldy when you
need more complex filtering rules.

so i wonder if netfilter provides a facility that would allow a process
to specify tags that are then added onto all sockets/connections/packets
this process and its children create in the future, and to filter based
upon those tags. something like:

| netfilter_add_tag("public-addresses-proxied-via-tor");
| netfilter_add_tag("internal-addresses-directly");
| netfilter_remove_tag("proxy-dns");
| execlp("wget", ...);

plus corresponding iptables rules:

# iptables ... --with-tag    public-addresses-proxied-via-tor \
               --with-tag    internal-addresses-directly \
               --without-tag proxy-dns ...

is there such a thing? of course it wouldn't have to be this interface
exactly, e.g. instead of strings the tags could be bits like connmark's
value/mask. there wouldn't be by any chance a way to to set a "default
connmark value" from inside a process, would there?

please note that i'm only asking about this tagging facility, and not
about the proxying use case above (which is merely a simplified example).

cheers

[1] https://trac.torproject.org/projects/tor/wiki/TheOnionRouter/TransparentProxy
