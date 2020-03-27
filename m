From: Eric Garver <eric@garver.life>
Subject: Re: What is the BEST GUI frontend to iptables firewall?
Date: Fri, 27 Mar 2020 13:28:34 -0400
Message-ID: <20200327172834.owufzw7dsjmidxvx@egarver>
References: <65bb6d398e79b3d924f518d20f40b48e@teo-en-ming.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <65bb6d398e79b3d924f518d20f40b48e@teo-en-ming.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming.com>
Cc: netfilter@vger.kernel.org

On Thu, Mar 26, 2020 at 07:35:01PM +0800, Turritopsis Dohrnii Teo En Ming wrote:
> Good evening from Singapore,
> 
> May I know what is the BEST GUI frontend to iptables firewall? It can be
> very involved and tedious to configure iptables firewall using the command
> line approach.
> 
> Are there any good rankings and reviews on the best GUI frontend to iptables
> firewall?

Disclaimer: I'm the current firewalld maintainer.

firewall-config is the firewalld GUI. It ships in a few distros by
default [1]. It's also available to install in many distributions. It
supports both iptables and nftables as firewall backends.

The current GUI is a bit dated. An alternatively is to use cockpit [2].
It provides basic functionality, but is often enough for simple use
cases.

The biggest negative of firewalld is it does not fully support output or
forward filtering. This is currently in development [3].

Hope that helps.
Eric.

[1] https://firewalld.org/ (see "Who is using it?" section)
[2] https://cockpit-project.org/
[3] https://github.com/orgs/firewalld/projects/1#card-25963208

