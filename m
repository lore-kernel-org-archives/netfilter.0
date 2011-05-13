From: jobhunts02@aol.com
Subject: Video connection timeout
Date: Fri, 13 May 2011 14:58:33 -0700
Message-ID: <6C249D4B-8247-4FD1-AD60-73E596244B57@aol.com>
Mime-Version: 1.0 (iPhone Mail 8J2)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

When I have video running and the video stops, I see that the connection is destroyed in about 5 seconds, which is what I want.

If, rather than stopping the video, I pull the plug, I have seen it take 350 and 380 seconds before the connection is destroyed.

Why is there such a large difference in the time to destroy a video connection between stopping the video and pulling the plug on it?  How can I shorten the time for the connection to get destroyed when pulling the plug?