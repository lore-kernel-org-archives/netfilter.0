From: Andrew Bate <mail@andrewbate.com>
Subject: Netfilter flow schematic: routing decision and output hook question
Date: Mon, 11 Oct 2021 00:52:58 +0100
Message-ID: <CAELCRPeqs4kxLcFDh0jvH1u2MeRZVwCnZTLt+tu0ZyYhqPV4vQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=andrewbate.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=mnOYwwAwpAFKsR8w/H3PfG7itVYYia26b4iWx4TfFu0=;
        b=VHWMNHlLYI3XA8MmpCUNMGI9FghoFVi4dbF/TJtPIYkD/NGTjU1eALHIWyQZyCT/QJ
         p79sO6TRxs3Sw3NbvDDmfacqqgsXvaSVb/FOHydbA5EdXlwzqtf6JVsTNXtJWAItk/B5
         p6HkjSxzb53D45LOGlOgaxC0DJ9SI+fM8g+8PMRzXZwmub5jDxWDzDEEEup6vZKQLOvm
         IppBeGMVx5CPILPoYe5mMGNzk7SJdyu3woaNxDasm5ynfKfC8HJWksfFkgFwMUCEsQwW
         uvQ4UKXBjNKGDpKl3DiCKzyVdu4YsgmNNu2UNNnVP+3tWzdgTEZ/nwoGA9vpEEE9uW3j
         fJNw==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,

(This is my first time posting to this list, so apologies if this is
not the correct place to ask.)

This page on the Netfilter wiki puts the output hook after the routing decision:
https://wiki.nftables.org/wiki-nftables/index.php/Netfilter_hooks

However, the iptables man page says that mangle/OUTPUT, nat/OUTPUT and
security/OUTPUT are "for altering locally-generated packets before
routing", whereas raw/OUTPUT and filter/OUTPUT are "for
locally-generated packets" (before routing I assume).

This seems to contradict the schematic (or perhaps the schematic is
incomplete and there is more than one routing decision on the path
from the local process to the output interface).

Combining what the man page says with the table of priorities given on
the above wiki page, I get the following:
Local process -> routing decision -> raw/OUTPUT -> connection tracking
-> mangle/OUTPUT -> nat/OUTPUT -> routing decision -> filter/OUTPUT ->
security/OUTPUT -> routing decision -> ...

Is this right? If so, why was Netfilter designed to have so many
routing decision points?

Why doesn't the schematic on the wiki show all of the points where a
routing decision happens on the path from local process to output
interface?

Thanks!
Andrew
